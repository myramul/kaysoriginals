-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: kaysoriginals
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artists`
--
USE kaysoriginals;

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Salvador','Dali','516-937-5922','Sdali@gmail.com','Spanish surrealist painter known for dreamlike, bizarre imagery and melting clocks in \"The Persistence of Memory.\"','imgs/artists/Salvador-Dali-1.png'),(2,'Claude','Monet','831-844-5174','ClaudeMonetworks@yahoo.com','French impressionist painter famous for his series of water lilies and vibrant depictions of natural light.','imgs/artists/Claude-Monet-2.png'),(3,'Frida','Kahlo','722-318-2960','FridaDesigns@gmail.com','Mexican artist known for surreal self-portraits that explore identity, pain, and culture with vivid symbolism.','imgs/artists/Frida-Kahlo-3.png'),(4,'Raphael','','621-431-5626','raphael122@aol.com','Renaissance master known for harmonious compositions and masterpieces like \"The School of Athens.\"','imgs/artists/Raphael--4.png'),(5,'Georges','Seurat','712-754-4002','SeuratGeogesCo@yahoo.com','French post-impressionist painter, pioneer of pointillism, and creator of \"A Sunday Afternoon on the Island of La Grande Jatte.\"','imgs/artists/Georges-Seurat-5.png'),(6,'Rosa','Bonheur','631-023-5714','BonheurRosaFond@aol.com','French realist painter celebrated for her detailed and dynamic animal paintings, such as \"The Horse Fair.\"','imgs/artists/Rosa-Bonheur-6.png'),(7,'Shen','Zhou','917-586-8662','ShenZhou@gmail.com','Ming Dynasty painter and poet known for expressive landscapes and scholarly artistic traditions.','imgs/artists/Shen-Zhou-7.png'),(8,'Sandro','Botticelli','412-520-0752','BotticelliSandro@gmail.com','Italian Renaissance artist best known for \"The Birth of Venus\" and \"Primavera,\" featuring mythological themes.','imgs/artists/Sandro-Botticelli-8.png'),(9,'Alma','Thomas','516-572-9900','AlmaArt@aol.com','African American expressionist painter known for vibrant, mosaic-like abstract works influenced by nature and space.','imgs/artists/Alma-Thomas-9.png'),(10,'Joan','Miro','631-228-4714','MiroJoanCo@gmail.com','Spanish surrealist painter famous for playful, abstract compositions and bold, symbolic colors.','imgs/artists/Joan-Miro-10.png');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artwork`
--

DROP TABLE IF EXISTS `artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artwork` (
  `artwork_id` int NOT NULL AUTO_INCREMENT,
  `artist_id` int DEFAULT NULL,
  `artwork_medium` varchar(255) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `avail_status` enum('Available','Sold') DEFAULT NULL,
  `theme` varchar(100) DEFAULT NULL,
  `year_made` varchar(4) DEFAULT NULL,
  `artwork_desc` text,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`artwork_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `artwork_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork`
--

LOCK TABLES `artwork` WRITE;
/*!40000 ALTER TABLE `artwork` DISABLE KEYS */;
INSERT INTO `artwork` VALUES (1,1,'Oil','24 x 33 cm','The Persistence of Memory',2270.00,'Available','Surrealism','1931','Fluidity of time and the relationship between memory, the past, present, and future.','imgs/artwork/The-Persistence-of-Memory-1-1.jpg'),(2,1,'Oil','398.8 × 299.7 cm','The Hallucinogenic Toreador',8000.00,'Available','Surrealism','1970','A complex, surreal composition filled with double images, this painting depicts a hidden toreador\'s face within a Venus de Milo figure. It explores themes of bullfighting, Dalí’s Catalonian heritage, and hallucinatory visions.','imgs/artwork/The-Hallucinogenic-Toreador-2-1.jpg'),(3,1,'Oil','167.5 x 268.6 cm','The Sacrament of the Last Supper',7550.00,'Available','Surrealism','1955','A fusion of religious imagery and mathematical precision, this painting portrays Christ and his disciples within a transparent dodecahedron, reflecting Dalí’s fascination with science and mysticism.','imgs/artwork/The-Sacrament-of-the-Last-Supper-3-1.jpg'),(4,2,'Oil','48 × 63 cm','Impression, Sunrise',15000.00,'Available','Impressionism','1872','This iconic painting, which inspired the name of the Impressionist movement, depicts the port of Le Havre with loose brushstrokes and a soft, atmospheric glow that captures the transient effects of light.','imgs/artwork/Impression-Sunrise-4-2.jpg'),(5,2,'Oil','90 × 100 cm','Water Lilies and Japanese Bridge',8000.00,'Available','Impressionism','1899','One of Monet’s famous Water Lilies series, this painting showcases his Japanese-style bridge in Giverny, surrounded by lush greenery and reflections in the water, emphasizing his love for nature and changing light.','imgs/artwork/Water-Lilies-and-Japanese-Bridge-5-2.jpg'),(6,2,'Oil','100 × 81 cm','The Artist\'s Garden at Giverny',8700.00,'Available','Impressionism','1900','A vibrant, colorful depiction of Monet’s own garden, filled with rows of blooming flowers, this painting reflects his deep appreciation for nature and mastery of light.','imgs/artwork/The-Artists-Garden-at-Giverny-6-2.jpg'),(7,2,'Oil','Various dimensions','Haystacks Wheatstacks Series',7690.00,'Sold','Impressionism','1891','A groundbreaking series that studies the effects of light and atmosphere on the same subject—haystacks in a field—at different times of the day and seasons.','imgs/artwork/Haystacks-Wheatstacks-Series-7-2.jpg'),(8,3,'Oil/Aluminum','67 x 67 inches','The Two Fridas',4300.00,'Available','Surrealism','1939','A powerful double self-portrait depicting two versions of Frida—one in a traditional Tehuana dress with an exposed, bleeding heart and the other in a European-style dress, symbolizing her emotional turmoil after her divorce from Diego Rivera.','imgs/artwork/The-Two-Fridas-8-3.jpg'),(9,3,'Oil/Aluminum','29 x 23 inches','Diego & I',2690.00,'Available','Surrealism','1949','A deeply personal self-portrait showing Diego Rivera’s face embedded in Frida’s forehead, with tears streaming down her face, representing her obsession, heartbreak, and suffering in their tumultuous relationship.','imgs/artwork/Diego-&-I-9-3.jpg'),(10,3,'Oil/Aluminum','24 x 18 inches','Self Portrait with Monkey',2270.00,'Sold','Surrealism','1938','One of several portraits featuring monkeys, which she kept as pets, this painting presents Frida in a composed, yet intense pose, symbolizing her deep connection with animals and her need for companionship.','imgs/artwork/Self-Portrait-with-Monkey-10-3.jpg'),(11,4,'Oil','82 cm × 67 cm','Portrait of Baldassare Castiglione',6200.00,'Available','Renaissance','1515','A masterful portrait of the Renaissance diplomat and writer, this painting captures Castiglione’s intellect and elegance through soft, naturalistic lighting and a warm, contemplative expression.','imgs/artwork/Portrait-of-Baldassare-Castiglione-11-4.jpg'),(12,4,'Oil/Pigments','170 cm × 118 cm','The Marriage of the Virgin',3200.00,'Sold','Renaissance','1504','A beautifully balanced composition depicting the wedding of Mary and Joseph, showcasing Raphael’s mastery of perspective with a grand temple in the background, influenced by Perugino.','imgs/artwork/The-Marriage-of-the-Virgin-12-4.jpg'),(13,4,'Oil/Pigments','269 cm × 201 cm','The Sistine Madonna',9500.00,'Available','Renaissance','1514','One of Raphael’s most famous religious works, featuring the Virgin Mary holding the Christ child, flanked by saints, with the iconic cherubs at the bottom that have become widely recognized in popular culture.','imgs/artwork/The-Sistine-Madonna-13-4.jpg'),(14,4,'Oil/Pigments','405 cm × 278 cm','Transfiguration',8000.00,'Sold','Renaissance','1520','Raphael’s final painting, blending two dramatic scenes: Christ’s radiant transfiguration above and the struggle of the apostles below, symbolizing the contrast between the divine and earthly realms.','imgs/artwork/Transfiguration-14-4.jpg'),(15,6,'Oil/Charcoal','13.5 x 11.5 cm','Two Rabbits',7690.00,'Available','Symbolism','1840','A finely detailed study of two rabbits, showing Bonheur\'s delicate approach to animal subjects, capturing their natural beauty and the texture of their fur with great realism.','imgs/artwork/Two-Rabbits-15-6.jpg'),(16,6,'Oil/Charcoal','134 x 260 cm','Ploughing in the Nivernais',6490.00,'Sold','Realism','1849','A powerful depiction of rural life, this large-scale painting portrays oxen plowing a field, showcasing Bonheur’s mastery of animal anatomy and the relationship between humans and nature in a realistic and heroic manner.','imgs/artwork/Ploughing-in-the-Nivernais-16-6.jpg'),(17,6,'Oil/Charcoal','244.5 x 506.7 cm','The Horse Fair',7590.00,'Sold','Realism','1855','Bonheur’s most iconic work, this large painting depicts a lively horse market in Paris with vivid detail and energy. The horses are captured in motion, emphasizing their strength and elegance, highlighting Bonheur’s expertise in portraying animals.','imgs/artwork/The-Horse-Fair-17-6.jpg'),(18,6,'Oil/Charcoal','85 x 100 cm','Haymaking in the Auvergne',8099.00,'Available','Impressionism','1855','This painting shows rural workers collecting hay in a scenic countryside setting. It blends human labor with nature, focusing on the harmonious interaction between workers, animals, and the landscape.','imgs/artwork/Haymaking-in-the-Auvergne-18-6.jpg'),(19,7,'Ink','93.8 x 72.1 cm','Lofty Mount Lu',4350.00,'Available','Chinese Landscape','1467','One of Shen Zhou’s most famous works, this towering landscape painting is an homage to his teacher and mentor. The vast, misty mountains and delicate brushwork reflect Shen Zhou’s mastery of literati painting, emphasizing spiritual depth and scholarly ideals.','imgs/artwork/Lofty-Mount-Lu-19-7.jpg'),(20,7,'Ink','24.2 x 18 cm','Falling Flowers',5600.00,'Available','Chinese Painting','1999','A poetic and expressive painting that captures the gentle motion of falling petals, symbolizing the fleeting nature of life. Shen Zhou’s brushstrokes evoke both movement and tranquility, making it a meditative work.','imgs/artwork/Falling-Flowers-20-7.jpg'),(21,7,'Ink','20 x 9.4 cm','Crabs Sketches of Life',750.00,'Sold','Chinese Ink','1999','A detailed ink painting that showcases Shen Zhou’s ability to capture nature with simplicity and elegance. The crabs are rendered with delicate, expressive brushwork, reflecting his keen observation of life.','imgs/artwork/Crabs-Sketches-of-Life-21-7.jpg'),(22,8,'Tempera/Oil/Fresco','172.5 × 278.5 cm','The Birth of Venus',5600.00,'Available','Renaissance','1486','One of Botticelli’s most iconic works, this painting depicts the mythological birth of Venus from the sea, standing on a shell and symbolizing beauty and divine love. The graceful composition and ethereal figures embody Renaissance ideals of harmony and beauty.','imgs/artwork/The-Birth-of-Venus-22-8.jpg'),(23,8,'Tempera/Oil/Fresco','203 × 314 cm','Primavera',7600.00,'Sold','Renaissance','1482','A complex allegorical painting, Primavera portrays a mythological scene with Venus at the center, surrounded by figures representing spring, love, and fertility. The lush colors and intricate details celebrate the beauty of nature and the power of love.','imgs/artwork/Primavera-23-8.jpg'),(24,8,'Tempera/Oil/Fresco','69 × 173 cm','Venus and Mars',5650.00,'Available','Early Renaissance','1483','A captivating depiction of the Roman goddess Venus and her lover Mars, shown in a peaceful, sensual moment after their battle. The painting contrasts the violence of war with the softness and love of Venus, showcasing Botticelli’s mastery of emotional and physical expression.','imgs/artwork/Venus-and-Mars-24-8.jpg'),(25,9,'Watercolor/Pencil/Acrylic','68 x 48 inches','The Eclipse',8700.00,'Available','Surrealism','1970','This dynamic abstract work uses vibrant colors to capture the celestial event of an eclipse, with swirling, concentric patterns symbolizing the mystery and beauty of the cosmos, demonstrating Thomas\'s exploration of color and form.','imgs/artwork/The-Eclipse-25-9.jpg'),(26,9,'Watercolor/Pencil/Acrylic','16 x 24 inches','Red Abstraction',7690.00,'Available','Abstract','1960','An intense, energetic abstract piece dominated by rich, warm reds, this painting reflects Thomas\'s mastery of color and form, utilizing geometric shapes and dynamic brushstrokes to evoke emotion and movement.','imgs/artwork/Red-Abstraction-26-9.jpg'),(27,9,'Watercolor/Pencil/Acrylic','52 x 48 inches','Starry Night and the Astronauts',6490.00,'Available','Contemporary','1972','Inspired by the moon landing, this painting incorporates a deep, cosmic space filled with radiant stars, with astronauts symbolizing the human connection to the vastness of the universe. The work combines abstraction with a sense of wonder and exploration.','imgs/artwork/Starry-Night-and-the-Astronauts-27-9.jpg'),(28,10,'Acrylic','123.2 x 122.3 cm','The Farm',8250.00,'Sold','Surrealism','1922','A semi-realistic yet surreal depiction of Miró’s family farm in Catalonia, this painting blends fine detail with abstract elements, marking a transition between traditional and modernist styles. Ernest Hemingway, who owned the painting, described it as “a snapshot of a whole era.”','imgs/artwork/The-Farm-28-10.jpg'),(29,10,'Acrylic','66 × 92 cm','Harlequin’s Carnival',6200.00,'Available','Surrealism','1925','One of Miró’s most famous works, this surrealist masterpiece bursts with playful, dreamlike imagery, featuring abstract figures, whimsical shapes, and bright colors that create a festive, musical atmosphere.','imgs/artwork/Harlequins-Carnival-29-10.jpg'),(30,10,'Acrylic','66 × 92 cm','The Tilled Field',3200.00,'Available','Surrealism','1924','A surreal landscape inspired by Miró’s Catalan roots, this painting merges farm animals, abstract human figures, and dreamlike elements, symbolizing a fusion of nature and imagination.','imgs/artwork/The-Tilled-Field-30-10.jpg'),(31,5,'Oil','15.8 x 24.7 cm','A River Bank',2270.00,'Available','Impressionism','1957','A serene and atmospheric painting using Seurat’s technique of pointillism, this work depicts figures leisurely walking along a riverbank, capturing the interplay of light and color with a sense of tranquility.','imgs/artwork/A-River-Bank-31-5.jpg'),(32,5,'Oil','201 cm x 300 cm','Bathers at Asnieres',8000.00,'Available','Post-Impressionism','1884','One of Seurat’s early masterpieces, this painting shows working-class men bathing in the Seine, rendered with meticulous brushwork and a sense of relaxation, representing the beauty of everyday life.','imgs/artwork/Bathers-at-Asnieres-32-5.jpg'),(33,5,'Oil','24.9 x 15.7 cm','The Morning Walk',4350.00,'Available','Realism','1999','A landscape showing a woman and child walking through a park, showcasing Seurat’s unique technique of dividing color into small dots that blend optically, creating a sense of light and atmosphere.','imgs/artwork/The-Morning-Walk-33-5.jpg');
/*!40000 ALTER TABLE `artwork` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-05 11:55:42
