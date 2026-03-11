import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Halo",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              username,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.indigo,
              ),
            ),

          ],
        ),
      ),

    );
  }
}