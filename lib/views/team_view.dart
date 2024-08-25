import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Our Team',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 115, 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildPersonCard(
              imagePath:
                  'assets/team_photos/photo_2024-08-25_09-49-33.jpg', // Replace with your image asset
              name: 'Omar Eid',
              description: 'Mobile application developer with ( FLUTTER )',
            ),
            SizedBox(height: 32),
            _buildPersonCard(
              imagePath:
                  'assets/team_photos/photo_2024-08-25_09-54-24.jpg', // Replace with your image asset
              name: 'Abdelrahman Sherif',
              description: 'Mobile application developer with ( FLUTTER )',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonCard({
    required String imagePath,
    required String name,
    required String description,
  }) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50, // Adjust the size as needed
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
