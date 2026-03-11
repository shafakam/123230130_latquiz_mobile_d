import 'package:flutter/material.dart';
import 'detail.dart';
import '../models/data.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  TextEditingController searchController = TextEditingController();
  List filteredProducts = products;

  void searchProduct(String keyword) {
    setState(() {
      filteredProducts = products
          .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],

      appBar: AppBar(
        title: Text("Halo, ${widget.username}"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
      ),

      body: Column(
        children: [
          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                style: TextStyle(color: Colors.white),
                onChanged: searchProduct,
                decoration: InputDecoration(
                  hintText: "Search product...",
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14),
                ),
              ),
            ),
          ),

          // GRID PRODUK
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: filteredProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(productIndex: products.indexOf(product)),
                      ),
                    );
                  },

                  child: Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // IMAGE
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              product.image,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),

                              SizedBox(height: 4),

                              Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text("${product.likes}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // FOOTER / NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.indigo,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],

        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(username: widget.username),
              ),
            );
          }
        },
      ),
    );
  }
}

// //Expanded(
//   child: ListView.builder(
//     itemCount: filteredProducts.length,
//     itemBuilder: (context, index) {

//       final product = filteredProducts[index];

//       return Card(
//         margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         elevation: 3,
//         child: ListTile(

//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DetailPage(
//                   productIndex: products.indexOf(product),
//                 ),
//               ),
//             );
//           },

//           leading: Image.network(
//             product.image,
//             width: 60,
//             fit: BoxFit.contain,
//           ),

//           title: Text(
//             product.name,
//             style: TextStyle(
//               color: Colors.indigo,
//               fontWeight: FontWeight.bold,
//             ),
//           ),

//           subtitle: Row(
//             children: [
//               Icon(Icons.favorite, color: Colors.red, size: 16),
//               SizedBox(width: 5),
//               Text("${product.likes}"),
//             ],
//           ),

//           trailing: Icon(Icons.arrow_forward_ios),

//         ),
//       );
//     },
//   ),
// )
//
//