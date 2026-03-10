import 'package:flutter/material.dart';
import 'models/data.dart';

class DetailPage extends StatefulWidget {
  final int productIndex;

  const DetailPage({super.key, required this.productIndex});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final product = products[widget.productIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Game'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,

        // BACK BUTTON
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        // LIKE BUTTON
        actions: [
          IconButton(
            icon: Icon(
              product.isLiked ? Icons.favorite : Icons.favorite_border,
              color: product.isLiked ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                product.isLiked = !product.isLiked;
              });
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Rp ${product.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Kategori: ${product.category}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Deskripsi:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, color: Colors.indigo),
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
