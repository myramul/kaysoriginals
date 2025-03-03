let currentPage = 1;
const artworkPerPage = 8;
let totalPages = 1; 

async function fetchArtwork(page) {
    try {
        const response = await fetch(`http://localhost:3000/api/artwork?page=${page}&limit=${artworkPerPage}`);
        const data = await response.json();

        totalPages = Math.ceil(data.total / artworkPerPage);

        if (!data.artwork) {
            console.error("No artwork data available");
            return;
        }

        displayArtwork(data.artwork);
        handlePagination();
    } catch (error) {
        console.error("Error fetching artwork:", error);
    }
}

function displayArtwork(artwork) {
    const container = document.getElementById('artwork-container');
    container.innerHTML = "";
  
    if (artwork.length === 0) {
      container.innerHTML = "<p>No artwork found.</p>";
      return;
    }
  
    artwork.forEach(artwork => {
      const artworkCard = document.createElement('div');
      artworkCard.classList.add('artwork');
  
      const artworkImage = document.createElement('img');
      artworkImage.src = artwork.image_path;
      artworkImage.alt = artwork.title;
  
      const artworkCaption = document.createElement('div');
      artworkCaption.classList.add('artwork-caption');
      artworkCaption.textContent = `${artwork.title} - ${artwork.artist_name} | $${artwork.price}`;
  
      artworkCard.appendChild(artworkImage);
      artworkCard.appendChild(artworkCaption);
  
      artworkCard.addEventListener('click', () => {
        window.location.href = `artwork-individual.html?artworkId=${artwork.artwork_id}`;
      });
  
      container.appendChild(artworkCard);
    });
  }
  

function changePage(direction) {
    currentPage += direction;
    fetchArtwork(currentPage);
}

function handlePagination() {
    const prevButton = document.getElementById('prev');
    const nextButton = document.getElementById('next');

    prevButton.disabled = currentPage === 1;
    nextButton.disabled = currentPage === totalPages;
}

// Initial fetch
fetchArtwork(currentPage);