import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        children: [
Container(
  decoration: BoxDecoration(
    color: Colors.purple,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 4,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  ),
  padding: EdgeInsets.all(16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          '30% discount on all home decoration products',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(width: 16.0),
      ElevatedButton(
        onPressed: () {
          // Handle GET IT button action
        },
        style: ElevatedButton.styleFrom(
          iconColor: Colors.orange,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          'GET IT',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
),

          Container(
            padding: EdgeInsets.all(16.0),
            child: const Text(
              textAlign: TextAlign.left,
              'Browse by Categories',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItem(title: 'Electronic'),
                CategoryItem(title: 'Fashion'),
                CategoryItem(title: 'Food'),
                CategoryItem(title: 'Home Appl...'),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Browse by Stores',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ProductItem(
                  title: 'Miniso Department Store',
                  location: 'Pokhara',
                  imageUrl: 'assets/images/miniso_img.png',
                ),
                ProductItem(
                  title: 'UFO Clothing',
                  location: 'Kathmandu',
                   imageUrl: 'assets/images/ufo_img.png',
                ),
                
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Latest Products',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Add your latest products here
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;

  CategoryItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Chip(
        label: Text(title),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final String location;
  final String imageUrl;

  ProductItem({
    required this.title,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 80.0,
            height: 80.0,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),

                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
