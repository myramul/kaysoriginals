const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",  // Change this to your MySQL password and run queries in kaysoriginals.sql
    database: "kaysoriginals"
});

db.connect(err => {
    if (err) {
        console.error("Database connection failed: ", err);
    } else {
        console.log("Connected to MySQL");
    }
});

app.get("/api/artists", (req, res) => {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 8;
    const offset = (page - 1) * limit;
  
    db.query("SELECT COUNT(*) AS total FROM artists", (err, countResult) => {
      if (err) {
        console.error("Error fetching total count: ", err);
        res.status(500).send("Error fetching artists count");
        return;
      }
  
      const total = countResult[0].total;
  
      db.query(
        "SELECT a.*, MIN(aw.image_path) AS artwork_image_path FROM artists a LEFT JOIN artwork aw ON a.artist_id = aw.artist_id GROUP BY a.artist_id LIMIT ? OFFSET ?",
        [limit, offset],
        (err, results) => {
          if (err) {
            console.error("Error fetching artists: ", err);
            res.status(500).send("Error fetching artists");
          } else {
            res.json({ artists: results, total: total });
          }
        }
      );
    });
  });

app.get('/api/artist/:artistId', (req, res) => {
    const artistId = req.params.artistId;
  
    db.query(`SELECT * FROM artists WHERE artist_id = ?`, [artistId], (err, results) => {
      if (err) {
        console.error(err);
        res.status(500).send({ message: 'Error fetching artist data' });
      } else {
        const artist = results[0];
  
        db.query(`SELECT * FROM artwork WHERE artist_id = ?`, [artistId], (err, artworkResults) => {
          if (err) {
            console.error(err);
            res.status(500).send({ message: 'Error fetching artwork data' });
          } else {
            artist.artwork = artworkResults;
            res.json(artist);
          }
        });
      }
    });
  });

app.get('/api/artwork/:artworkId', (req, res) =>{
    const artworkId = req.params.artworkId;

    const query = ` SELECT a.*, CONCAT(ar.first_name, ' ', ar.last_name) AS artist_name
    FROM artwork a, artists ar 
    WHERE a.artist_id = ar.artist_id AND a.artwork_id = ?
    `;

    db.query(query, [artworkId], (err, results) => {
      if (err){
        console.error(err);
        res.status(500).send({message: 'Error fetching artwork data'});
      }else{
        res.json(results[0] || {});
      }
    });
});
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
