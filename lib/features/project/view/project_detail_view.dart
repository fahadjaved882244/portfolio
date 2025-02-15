import 'package:flutter/material.dart';

class ProjectDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://via.placeholder.com/800x400', // Replace with your project image URL
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 24),

            // Project Title
            Text(
              'E-Commerce Platform for GreenTech Solutions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Company Name
            Text(
              'Developed for: GreenTech Solutions Inc.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),

            // Project Description
            Text(
              'Project Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'GreenTech Solutions is a leading provider of eco-friendly products. This project involved building a fully responsive e-commerce platform to showcase their products, manage inventory, and process orders seamlessly. The platform was designed to provide an intuitive user experience while ensuring high performance and scalability.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 24),

            // Key Contributions
            Text(
              'Key Contributions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContributionItem(
                    'Designed and implemented the user interface using Flutter.'),
                _buildContributionItem(
                    'Integrated RESTful APIs for product listing, cart management, and order processing.'),
                _buildContributionItem(
                    'Optimized the platform for performance, reducing load times by 30%.'),
                _buildContributionItem(
                    'Implemented secure payment gateways for seamless transactions.'),
                _buildContributionItem(
                    'Collaborated with the backend team to ensure smooth data flow and synchronization.'),
              ],
            ),
            SizedBox(height: 24),

            // Technologies Used
            Text(
              'Technologies Used',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTechnologyChip('Flutter'),
                _buildTechnologyChip('Dart'),
                _buildTechnologyChip('Firebase'),
                _buildTechnologyChip('REST APIs'),
                _buildTechnologyChip('Node.js'),
                _buildTechnologyChip('MongoDB'),
                _buildTechnologyChip('Stripe'),
                _buildTechnologyChip('AWS S3'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build contribution items
  Widget _buildContributionItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: 8, color: Colors.blue),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build technology chips
  Widget _buildTechnologyChip(String technology) {
    return Chip(
      label: Text(
        technology,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
