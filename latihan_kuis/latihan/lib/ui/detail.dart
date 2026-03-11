import 'package:flutter/material.dart';
import '../models/data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final int productIndex;

  const DetailPage({super.key, required this.productIndex});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int selectedStorageIndex = 0;

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {

    final product = products[widget.productIndex];

    return Scaffold(

      appBar: AppBar(
        title: const Text("Detail Produk"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

        actions: [

          IconButton(
            icon: Icon(
              product.isLiked ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: (){
              setState(() {

                if(product.isLiked){
                  product.likes--;
                }else{
                  product.likes++;
                }

                product.isLiked = !product.isLiked;

              });
            },
          )

        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// IMAGE
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.white,
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// NAME
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// LIKES
                  Row(
                    children: [

                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),

                      const SizedBox(width: 6),

                      Text("${product.likes} Likes"),

                    ],
                  ),

                  const SizedBox(height: 12),

                  /// PRICE
                  Text(
                    "Rp ${product.price[selectedStorageIndex]}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// STORAGE TITLE
                  const Text(
                    "Pilih Storage",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// STORAGE BUTTONS
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        product.storage.length,
                        (index){

                          bool selected =
                              selectedStorageIndex == index;

                          return Padding(
                            padding:
                            const EdgeInsets.only(right: 10),

                            child: ChoiceChip(
                              label: Text(product.storage[index]),
                              selected: selected,
                              selectedColor: Colors.indigo,

                              labelStyle: TextStyle(
                                color: selected
                                    ? Colors.white
                                    : Colors.indigo,
                              ),

                              onSelected: (value){
                                setState(() {
                                  selectedStorageIndex = index;
                                });
                              },
                            ),
                          );

                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// CATEGORY
                  Text(
                    "Kategori: ${product.category}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// DESCRIPTION
                  const Text(
                    "Deskripsi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// BUTTON LINK
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        openLink(product.link);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding:
                        const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),

                      child: const Text(
                        "Lihat / Beli Produk",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}

