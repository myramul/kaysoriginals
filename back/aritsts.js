let currentPage = 1;
const artistsPerPage = 8;
let totalPages = 1; 

async function fetchArtists(page) {
    try {
        const response = await fetch(`http://localhost:3000/api/artists?page=${page}&limit=${artistsPerPage}`);
        const data = await response.json();
        console.log("Received artists data:", data);

        totalPages = Math.ceil(data.total / artistsPerPage);

        if (!data.artists) {
            console.error("No artists data available");
            return;
        }

        displayArtists(data.artists);
        handlePagination();
    } catch (error) {
        console.error("Error fetching artists:", error);
    }
}

function displayArtists(artists) {
    const container = document.getElementById('artists-container');
    container.innerHTML = "";
  
    if (artists.length === 0) {
      container.innerHTML = "<p>No artists found.</p>";
      return;
    }
  
    artists.forEach(artist => {
      const artistCard = document.createElement('div');
      artistCard.classList.add('artist');
  
      const artistImage = document.createElement('img');
      artistImage.src = artist['image_path'];
      artistImage.alt = artist['first_name'] + ' ' + artist['last_name'];
      artistImage.classList.add('artist-image');
  
      const artistName = document.createElement('p');
      artistName.textContent = artist['first_name'] + ' ' + artist['last_name'];
  
      const artworkImage = document.createElement('img');
      artworkImage.src = artist['artwork_image_path'];
      console.log("Artwork image path:", artist['artwork_image_path']);
      artworkImage.alt = artist['first_name'] + ' ' + artist['last_name'] + "'s artwork";
      artworkImage.classList.add('artwork-image');
      artworkImage.style.display = 'none';
  
      artistCard.appendChild(artistImage);
      artistCard.appendChild(artistName);
      artistCard.appendChild(artworkImage);
  
      artistCard.addEventListener('mouseover', () => {
        artworkImage.style.display = 'block';
      });
  
      artistCard.addEventListener('mouseout', () => {
        artworkImage.style.display = 'none';
      });

      artistCard.addEventListener('click', () => {
        window.location.href = `artist-artwork.html?artistId=${artist.artist_id}`;
      });
  
      container.appendChild(artistCard);
    });
  }

  

function changePage(direction) {
    currentPage += direction;
    fetchArtists(currentPage);
}

function handlePagination() {
    const prevButton = document.getElementById('prev');
    const nextButton = document.getElementById('next');

    prevButton.disabled = currentPage === 1;
    nextButton.disabled = currentPage === totalPages;
}

// Initial fetch
fetchArtists(currentPage);