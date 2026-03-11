class User {
  String username;
  String password;
  String nama;

  User({required this.username, required this.password, required this.nama});
}

User user1 = User(
  username: 'budi123',
  password: 'password123',
  nama: 'Budi Santoso',
);

class Product {
  int id;
  String name;
  String category;
  String description;
  String price;
  String image;
  bool isLiked;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
    this.isLiked = false,
  });
}

final List<Product> products = [
  Product(
  id: 1,
  name: "The Witcher 3: Wild Hunt",
  category: "RPG",
  description: "Open world RPG dimana pemain berperan sebagai Geralt, seorang pemburu monster.",
  price: '350000',
  image: "https://upload.wikimedia.org/wikipedia/en/0/0c/Witcher_3_cover_art.jpg",
),

Product(
  id: 2,
  name: "Minecraft",
  category: "Sandbox",
  description: "Game sandbox yang memungkinkan pemain membangun dan menjelajah dunia blok.",
  price: "300000",
  image: "https://upload.wikimedia.org/wikipedia/en/thumb/b/b6/Minecraft_2024_cover_art.png/250px-Minecraft_2024_cover_art.png",
),

Product(
  id: 3,
  name: "Call of Duty: Warzone",
  category: "Shooter",
  description: "Game battle royale dengan gameplay perang modern.",
  price: "free",
  image: "https://upload.wikimedia.org/wikipedia/en/6/65/COD_Warzone_Cover_Art.jpg",
),

Product(
  id: 4,
  name: "EA Sports FC 24",
  category: "Sports",
  description: "Game simulasi sepak bola dengan tim dan liga dunia.",
  price: "900000",
  image: "https://upload.wikimedia.org/wikipedia/en/b/b3/EA_FC24_Cover.jpg",
),

Product(
  id: 5,
  name: "Grand Theft Auto V",
  category: "Action",
  description: "Game open world dengan cerita kriminal di kota Los Santos.",
  price: "280000",
  image: "https://upload.wikimedia.org/wikipedia/id/a/a5/Grand_Theft_Auto_V.png",
),

Product(
  id: 6,
  name: "Genshin Impact",
  category: "Adventure RPG",
  description: "Game RPG dunia terbuka dengan karakter anime dan sistem elemen.",
  price: "Free",
  image: "https://cdn1.epicgames.com/spt-assets/99dc46c68ea14324964a856d18dcac5b/genshin-impact-hqdph.jpg",
),

Product(
  id: 7,
  name: "Stardew Valley",
  category: "Simulation",
  description: "Game simulasi bertani dan kehidupan desa.",
  price: "115000",
  image: "https://upload.wikimedia.org/wikipedia/en/f/fd/Logo_of_Stardew_Valley.png",
),

Product(
  id: 8,
  name: "Elden Ring",
  category: "Action RPG",
  description: "Game RPG fantasi gelap dengan dunia luas dan pertarungan menantang.",
  price: "850000",
  image: "https://upload.wikimedia.org/wikipedia/en/thumb/f/f0/Elden_Ring_Nightreign_cover_art.png/250px-Elden_Ring_Nightreign_cover_art.png",
),

Product(
  id: 9,
  name: "Among Us",
  category: "Party",
  description: "Game multiplayer deduksi sosial untuk menemukan impostor.",
  price: "45000",
  image: "https://upload.wikimedia.org/wikipedia/en/9/9a/Among_Us_cover_art.jpg",
),

Product(
  id: 10,
  name: "Valorant",
  category: "Tactical Shooter",
  description: "Game FPS taktis 5v5 dengan karakter unik.",
  price: "free",
  image: "https://cdn1.epicgames.com/offer/cbd5b3d310a54b12bf3fe8c41994174f/EGS_VALORANT_RiotGames_S1_2560x1440-e1dab02ef10e4470a609affcfb8f1a1a",
),
];