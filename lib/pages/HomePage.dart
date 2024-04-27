import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fooddeliverapp/helper/auth.dart';
import 'package:fooddeliverapp/pages/BrowseRestaurants.dart';
import 'package:fooddeliverapp/pages/LoginPage.dart';
import '../firebase_options.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                CategoryCard(
                  categoryName: 'Italian',
                  image: 'assets/pasta.jpg',
                  onTap: () {
                    // Navigate to Italian restaurants page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BrowseRestaurantPage()),
                    );
                  },
                ),
                CategoryCard(
                  categoryName: 'Fast Food',
                  image: 'assets/burger.jpg',
                  onTap: () {
                    // Navigate to American restaurants page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BrowseRestaurantPage()),
                    );
                  },
                ),
                CategoryCard(
                  categoryName: 'Japanese',
                  image: 'assets/sushi.jpg',
                  onTap: () {
                    // Navigate to Japanese restaurants page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BrowseRestaurantPage()),
                    );
                  },
                ),
                CategoryCard(
                  categoryName: 'Mexican',
                  image: 'assets/ragingburrito.jpg',
                  onTap: () {
                    // Navigate to Japanese restaurants page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BrowseRestaurantPage()),
                    );
                  },
                ),
                // Add more category cards here
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String image;
  final VoidCallback onTap;

  const CategoryCard({
    required this.categoryName,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 150.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categoryName,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
