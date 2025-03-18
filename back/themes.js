document.addEventListener("DOMContentLoaded", async function () {
    const themeContainer = document.getElementById("theme-container");

    try {
        const response = await fetch("http://localhost:3000/api/themes");
        const themes = await response.json();

        themes.forEach(theme => {
            const card = document.createElement("div");
            card.classList.add("theme-card");
   
            card.style.backgroundImage = `url(${theme.image_path})`;
            card.style.backgroundSize = "cover";
            card.style.backgroundPosition = "center";
            card.style.setProperty("--bg-image", `url(${theme.image_path})`);

    
            const img = document.createElement("img");
            img.src = theme.image_path;
            img.alt = theme.theme;

    
            const text = document.createElement("span");
            text.textContent = theme.theme;


            card.appendChild(img);
            card.appendChild(text);
            card.addEventListener("click", () => {
                window.location.href = `artwork.html?theme=${encodeURIComponent(theme.theme)}`;
            });

            themeContainer.appendChild(card);
        });
    } catch (error) {
        console.error("Error fetching themes:", error);
    }
});
