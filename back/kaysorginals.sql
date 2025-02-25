-- Create the database
CREATE DATABASE kaysoriginals;
USE kaysoriginals;

-- Create the artists table
CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    bio VARCHAR(200),
    image_path VARCHAR(255)
);

-- Insert data for artists table 
INSERT INTO artists (first_name, last_name, phone_number, email, bio) VALUES
('Salvador', 'Dali', '516-937-5922', 'Sdali@gmail.com', 
 'Spanish surrealist painter known for dreamlike, bizarre imagery and melting clocks in "The Persistence of Memory."'),

('Claude', 'Monet', '831-844-5174', 'ClaudeMonetworks@yahoo.com', 
 'French impressionist painter famous for his series of water lilies and vibrant depictions of natural light.'),

('Frida', 'Kahlo', '722-318-2960', 'FridaDesigns@gmail.com', 
 'Mexican artist known for surreal self-portraits that explore identity, pain, and culture with vivid symbolism.'),

('Raphael', '', '621-431-5626', 'raphael122@aol.com', 
 'Renaissance master known for harmonious compositions and masterpieces like "The School of Athens."'),

('Georges', 'Seurat', '712-754-4002', 'SeuratGeogesCo@yahoo.com', 
 'French post-impressionist painter, pioneer of pointillism, and creator of "A Sunday Afternoon on the Island of La Grande Jatte."'),

('Rosa', 'Bonheur', '631-023-5714', 'BonheurRosaFond@aol.com', 
 'French realist painter celebrated for her detailed and dynamic animal paintings, such as "The Horse Fair."'),

('Shen', 'Zhou', '917-586-8662', 'ShenZhou@gmail.com', 
 'Ming Dynasty painter and poet known for expressive landscapes and scholarly artistic traditions.'),

('Sandro', 'Botticelli', '412-520-0752', 'BotticelliSandro@gmail.com', 
 'Italian Renaissance artist best known for "The Birth of Venus" and "Primavera," featuring mythological themes.'),

('Alma', 'Thomas', '516-572-9900', 'AlmaArt@aol.com', 
 'African American expressionist painter known for vibrant, mosaic-like abstract works influenced by nature and space.'),

('Joan', 'Miro', '631-228-4714', 'MiroJoanCo@gmail.com', 
 'Spanish surrealist painter famous for playful, abstract compositions and bold, symbolic colors.');

-- Update the image_path for each artist using their actual artist_id
UPDATE artists 
SET image_path = CONCAT('imgs/artists/', first_name, '-', last_name, '-', artist_id, '.png')
WHERE artist_id >= 0;

-- Check artists table
SELECT * FROM artists;


-- Create artwork table
DROP TABLE artwork;
CREATE TABLE artwork (
    artwork_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT,
    artwork_medium VARCHAR(255),
    dimensions VARCHAR(255),
    title VARCHAR(255),
    price DECIMAL(10,2),
    avail_status ENUM('Available', 'Sold'),
    theme VARCHAR(100),
	year_made VARCHAR(4),
    artwork_desc TEXT,
    image_path VARCHAR(255),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- Insert artwork data
INSERT INTO artwork (artist_id, artwork_medium, dimensions, title, price, avail_status, theme, year_made, artwork_desc, image_path) VALUES
(1, 'Oil', '24 x 33 cm', 'The Persistence of Memory', 2270, 'Available', 'Surrealism', '1931', 'Fluidity of time and the relationship between memory, the past, present, and future.', ''),
(1, 'Oil', '398.8 × 299.7 cm', 'The Hallucinogenic Toreador', 8000, 'Available', 'Surrealism', '1970', 'A complex, surreal composition filled with double images, this painting depicts a hidden toreador\'s face within a Venus de Milo figure. It explores themes of bullfighting, Dalí’s Catalonian heritage, and hallucinatory visions.', ''),
(1, 'Oil', '167.5 x 268.6 cm', 'The Sacrament of the Last Supper', 7550, 'Available', 'Surrealism', '1955', 'A fusion of religious imagery and mathematical precision, this painting portrays Christ and his disciples within a transparent dodecahedron, reflecting Dalí’s fascination with science and mysticism.', ''),
(2, 'Oil', '48 × 63 cm', 'Impression, Sunrise', 9500, 'Available', 'Impressionism', '1872', 'This iconic painting, which inspired the name of the Impressionist movement, depicts the port of Le Havre with loose brushstrokes and a soft, atmospheric glow that captures the transient effects of light.', ''),
(2, 'Oil', '90 × 100 cm', 'Water Lilies and Japanese Bridge', 8000, 'Available', 'Impressionism', '1899', 'One of Monet’s famous Water Lilies series, this painting showcases his Japanese-style bridge in Giverny, surrounded by lush greenery and reflections in the water, emphasizing his love for nature and changing light.', ''),
(2, 'Oil', '100 × 81 cm', 'The Artist\'s Garden at Giverny', 8700, 'Available', 'Impressionism', '1900', 'A vibrant, colorful depiction of Monet’s own garden, filled with rows of blooming flowers, this painting reflects his deep appreciation for nature and mastery of light.', ''),
(2, 'Oil', 'Various dimensions', 'Haystacks Wheatstacks Series', 7690, 'Sold', 'Impressionism', '1891', 'A groundbreaking series that studies the effects of light and atmosphere on the same subject—haystacks in a field—at different times of the day and seasons.', ''),
(3, 'Oil/Aluminum', '67 x 67 inches', 'The Two Fridas', 4300, 'Available', 'Surrealism', '1939', 'A powerful double self-portrait depicting two versions of Frida—one in a traditional Tehuana dress with an exposed, bleeding heart and the other in a European-style dress, symbolizing her emotional turmoil after her divorce from Diego Rivera.', ''),
(3, 'Oil/Aluminum', '29 x 23 inches', 'Diego & I', 2690, 'Available', 'Surrealism', '1949', 'A deeply personal self-portrait showing Diego Rivera’s face embedded in Frida’s forehead, with tears streaming down her face, representing her obsession, heartbreak, and suffering in their tumultuous relationship.', ''),
(3, 'Oil/Aluminum', '24 x 18 inches', 'Self Portrait with Monkey', 2270, 'Sold', 'Surrealism', '1938', 'One of several portraits featuring monkeys, which she kept as pets, this painting presents Frida in a composed, yet intense pose, symbolizing her deep connection with animals and her need for companionship.', ''),
(4, 'Oil', '82 cm × 67 cm', 'Portrait of Baldassare Castiglione', 6200, 'Available', 'Renaissance', '1515', 'A masterful portrait of the Renaissance diplomat and writer, this painting captures Castiglione’s intellect and elegance through soft, naturalistic lighting and a warm, contemplative expression.', ''),
(4, 'Oil/Pigments', '170 cm × 118 cm', 'The Marriage of the Virgin', 3200, 'Sold', 'Renaissance', '1504', 'A beautifully balanced composition depicting the wedding of Mary and Joseph, showcasing Raphael’s mastery of perspective with a grand temple in the background, influenced by Perugino.', ''),
(4, 'Oil/Pigments', '269 cm × 201 cm', 'The Sistine Madonna', 9500, 'Available', 'Renaissance', '1514', 'One of Raphael’s most famous religious works, featuring the Virgin Mary holding the Christ child, flanked by saints, with the iconic cherubs at the bottom that have become widely recognized in popular culture.', ''),
(4, 'Oil/Pigments', '405 cm × 278 cm', 'Transfiguration', 8000, 'Sold', 'Renaissance', '1520', 'Raphael’s final painting, blending two dramatic scenes: Christ’s radiant transfiguration above and the struggle of the apostles below, symbolizing the contrast between the divine and earthly realms.', '');
INSERT INTO artwork (artist_id, artwork_medium, dimensions, title, price, avail_status, theme, year_made, artwork_desc, image_path) VALUES
(6, 'oil/charcoal', '13.5 x 11.5 cm', 'Two Rabbits', 7690, 'Available', 'Symbolism', '1840', 'A finely detailed study of two rabbits, showing Bonheur\'s delicate approach to animal subjects, capturing their natural beauty and the texture of their fur with great realism.', ''),
(6, 'oil/charcoal', '134 x 260 cm', 'Ploughing in the Nivernais', 6490, 'Sold', 'Realism', '1849', 'A powerful depiction of rural life, this large-scale painting portrays oxen plowing a field, showcasing Bonheur’s mastery of animal anatomy and the relationship between humans and nature in a realistic and heroic manner.', ''),
(6, 'oil/charcoal', '244.5 x 506.7 cm', 'The Horse Fair', 7590, 'Sold', 'Realism', '1855', 'Bonheur’s most iconic work, this large painting depicts a lively horse market in Paris with vivid detail and energy. The horses are captured in motion, emphasizing their strength and elegance, highlighting Bonheur’s expertise in portraying animals.', ''),
(6, 'oil/charcoal', '85 x 100 cm', 'Haymaking in the Auvergne', 8099, 'Available', 'Impressionism', '1855', 'This painting shows rural workers collecting hay in a scenic countryside setting. It blends human labor with nature, focusing on the harmonious interaction between workers, animals, and the landscape.', ''),
(7, 'ink', '93.8 x 72.1 cm', 'Lofty Mount Lu', 4350, 'Available', 'Chinese Landscape', '1467', 'One of Shen Zhou’s most famous works, this towering landscape painting is an homage to his teacher and mentor. The vast, misty mountains and delicate brushwork reflect Shen Zhou’s mastery of literati painting, emphasizing spiritual depth and scholarly ideals.', ''),
(7, 'ink', '24.2 x 18 cm', 'Falling Flowers', 5600, 'Available', 'Chinese Painting', '1999', 'A poetic and expressive painting that captures the gentle motion of falling petals, symbolizing the fleeting nature of life. Shen Zhou’s brushstrokes evoke both movement and tranquility, making it a meditative work.', ''),
(7, 'ink', '20 x 9.4 cm', 'Crabs Sketches of Life', 1000, 'Sold', 'Chinese Ink', '1999', 'A detailed ink painting that showcases Shen Zhou’s ability to capture nature with simplicity and elegance. The crabs are rendered with delicate, expressive brushwork, reflecting his keen observation of life.', ''),
(8, 'tempera/oil/fresco', '172.5 × 278.5 cm', 'The Birth of Venus', 5600, 'Available', 'Renaissance', '1486', 'One of Botticelli’s most iconic works, this painting depicts the mythological birth of Venus from the sea, standing on a shell and symbolizing beauty and divine love. The graceful composition and ethereal figures embody Renaissance ideals of harmony and beauty.', ''),
(8, 'tempera/oil/fresco', '203 × 314 cm', 'Primavera', 7600, 'Sold', 'Renaissance', '1482', 'A complex allegorical painting, Primavera portrays a mythological scene with Venus at the center, surrounded by figures representing spring, love, and fertility. The lush colors and intricate details celebrate the beauty of nature and the power of love.', ''),
(8, 'tempera/oil/fresco', '69 × 173 cm', 'Venus and Mars', 5650, 'Available', 'Early Renaissance', '1483', 'A captivating depiction of the Roman goddess Venus and her lover Mars, shown in a peaceful, sensual moment after their battle. The painting contrasts the violence of war with the softness and love of Venus, showcasing Botticelli’s mastery of emotional and physical expression.', ''),
(9, 'watercolor/pencil/acrylic', '68 x 48 inches', 'The Eclipse', 8700, 'Available', 'Surrealism', '1970', 'This dynamic abstract work uses vibrant colors to capture the celestial event of an eclipse, with swirling, concentric patterns symbolizing the mystery and beauty of the cosmos, demonstrating Thomas\'s exploration of color and form.', ''),
(9, 'watercolor/pencil/acrylic', '16 x 24 inches', 'Red Abstraction', 7690, 'Available', 'Abstract', '1960', 'An intense, energetic abstract piece dominated by rich, warm reds, this painting reflects Thomas\'s mastery of color and form, utilizing geometric shapes and dynamic brushstrokes to evoke emotion and movement.', ''),
(9, 'watercolor/pencil/acrylic', '52 x 48 inches', 'Starry Night and the Astronauts', 6490, 'Available', 'Contemporary', '1972', 'Inspired by the moon landing, this painting incorporates a deep, cosmic space filled with radiant stars, with astronauts symbolizing the human connection to the vastness of the universe. The work combines abstraction with a sense of wonder and exploration.', ''),
(10, 'acrylic', '123.2 x 122.3 cm', 'The Farm', 8250, 'Sold', 'Surrealism', '1922', 'A semi-realistic yet surreal depiction of Miró’s family farm in Catalonia, this painting blends fine detail with abstract elements, marking a transition between traditional and modernist styles. Ernest Hemingway, who owned the painting, described it as “a snapshot of a whole era.”', ''),
(10, 'acrylic', '66 × 92 cm', 'Harlequin’s Carnival', 6200, 'Available', 'Surrealism', '1925', 'One of Miró’s most famous works, this surrealist masterpiece bursts with playful, dreamlike imagery, featuring abstract figures, whimsical shapes, and bright colors that create a festive, musical atmosphere.', ''),
(10, 'acrylic', '66 × 92 cm', 'The Tilled Field', 3200, 'Available', 'Surrealism', '1924', 'A surreal landscape inspired by Miró’s Catalan roots, this painting merges farm animals, abstract human figures, and dreamlike elements, symbolizing a fusion of nature and imagination.', '');
INSERT INTO artwork (artist_id, artwork_medium, dimensions, title, price, avail_status, theme, year_made, artwork_desc, image_path) VALUES
(5, 'Oil', '15.8 x 24.7 cm', 'A River Bank', 2270, 'Available', 'Impressionism', '1957', 'A serene and atmospheric painting using Seurat’s technique of pointillism, this work depicts figures leisurely walking along a riverbank, capturing the interplay of light and color with a sense of tranquility.', ''),
(5, 'Oil', '201 cm x 300 cm', 'Bathers at Asnieres', 8000, 'Available', 'Post-Impressionism', '1884', 'One of Seurat’s early masterpieces, this painting shows working-class men bathing in the Seine, rendered with meticulous brushwork and a sense of relaxation, representing the beauty of everyday life.', ''),
(5, 'Oil', '24.9 x 15.7 cm', 'The Morning Walk', 4350, 'Available', 'Realism', '1999', 'A landscape showing a woman and child walking through a park, showcasing Seurat’s unique technique of dividing color into small dots that blend optically, creating a sense of light and atmosphere.', '');

SELECT * FROM artwork;

-- Artwork image path
UPDATE artwork 
SET image_path = CONCAT('imgs/artwork/', REPLACE(title, ' ', '-'), '-', artwork_id, '-', artist_id, '.jpg')
WHERE artwork_id >= 0;

-- Check artwork table
SELECT * FROM artwork
WHERE artist_id = 1 OR artist_id = 2;

