import 'package:flutter/material.dart';
import 'detail.dart';
import 'models/data.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController searchController = TextEditingController();
  List filteredProducts = products;

  void searchGame(String keyword) {
    setState(() {
      filteredProducts = products
          .where((game) =>
              game.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 5,
        shadowColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            // USERNAME LOGIN
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Halo, ${widget.username}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),

            SizedBox(height: 10),

            // SEARCH FIELD
            TextField(
              controller: searchController,
              onChanged: searchGame,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search Game...",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search),
    
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 10),

            // LIST GAME
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {

                  final game = filteredProducts[index];

                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              productIndex: products.indexOf(game),
                              
                            ),
                          ),
                        );
                      },

                      leading: Image.network(
                        game.image,
                        width: 60,
                        fit: BoxFit.cover,
                      ),

                      title: Text(
                        game.name,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
                      ),

                      subtitle: Text(
                        game.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}