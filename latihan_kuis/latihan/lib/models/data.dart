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
  List<String> storage;
  List<String> price;
  String image;
  int likes;
  String link;
  bool isLiked;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.storage,
    required this.price,
    required this.image,
    required this.likes,
    required this.link,
    this.isLiked = false,
  });
}

final List<Product> products = [
  Product(
    id: 1,
    name: "Wireless Headphone",
    category: "Electronics",
    storage: ["64GB", "128GB", "256GB"],
    price: ["1500000", "2000000", "2500000"],
    image:
        "https://cdn.dummyjson.com/product-images/mobile-accessories/apple-airpods-max-silver/1.webp",
    description:
        "Wireless headphone dengan kualitas suara jernih dan baterai tahan lama.",
    likes: 155,
    link: "https://www.sony.co.id/id/headphones/wireless",

  ),
  Product(
    id: 2,
    name: "Smart Watch",
    category: "Electronics",
    storage: ["32GB", "64GB", "128GB"],
    price: ["2000000", "2500000", "3000000"],
    image:
        "https://cdn.dummyjson.com/product-images/mobile-accessories/apple-watch-series-4-gold/1.webp",
    description:
        "Smart watch dengan fitur kesehatan, notifikasi, dan desain elegan.",
    likes: 270,
    link: "https://www.samsung.com/id/watches/all-watches/",
  ),
  Product(
    id: 3,
    name: "iPhone X",
    category: "Electronics",
    storage: ["64GB", "128GB", "256GB"],
    price: ["3500000", "4000000", "4500000"], 
    image:
        "https://cdn.dummyjson.com/product-images/smartphones/iphone-x/1.webp",
    description: "iPhone X dengan layar OLED dan desain minimalis.",
    likes: 500,
    link: "https://support.apple.com/id-id/111864",
  ),
  Product(
    id: 4,
    name: "Monopod",
    category: "Electronics",
    storage: ["32GB", "64GB", "128GB"],
    price: ["950000", "1200000", "1500000"], 
    image:
        "https://cdn.dummyjson.com/product-images/mobile-accessories/monopod/1.webp",
    description: "Monopod dengan desain ringkas dan bahan berkualitas tinggi.",
    likes: 80,
    link: "https://fujishop.id/product-category/accessories/tripod-monopod/",
  ),
  Product(
    id: 5,
    name: "Portable Speaker",
    category: "Electronics",
    storage: ["32GB", "64GB", "128GB"],
    price: ["500000", "750000", "1000000"],
    image:
        "https://cdn.dummyjson.com/product-images/mobile-accessories/amazon-echo-plus/1.webp",
    description: "Speaker portable dengan bass kuat dan koneksi Bluetooth.",
    likes: 210,
    link: "https://www.sony.co.id/id/wireless-speakers/portable",
  ),
];