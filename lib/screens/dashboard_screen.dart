import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Row(
    children: [
      SvgPicture.asset(
        'assets/icons/logo.svg', // Ensure this path is correct
        height: 60, // Adjust height as needed
      ),
      SizedBox(width: 10), // Space between logo and text
      Text(
        'Hi! Rojal',
        style: TextStyle(
          fontSize: 20,
          color: const Color.fromARGB(255, 255, 255, 255), // Adjust color as needed
        ),
      ),
    ],
  ),
  backgroundColor: const Color.fromARGB(255, 32, 60, 108),
),

      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 198, 185, 65),
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '30% discount on all home decoration products',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle GET IT button action
                  },
                  child: Text('GET IT'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Shop by Category',
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
                      CategoryItem(title: 'Shoes'),
                      CategoryItem(title: 'Furniture'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // ProductItem(
                //   title: 'Leather Women Bag',
                //   price: 135.0,
                //   imageUrl: 'assets/images/bag.png',
                // ),
                // ProductItem(
                //   title: 'Wireless Headphone',
                //   price: 65.0,
                //   imageUrl: 'assets/images/headphone.png',
                // ),
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
                // ProductItem(
                //   title: 'Headphone Holder',
                //   price: 34.0,
                //   imageUrl: 'assets/images/holder.png',
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final String title;

  CategoryItem({required this.title});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: _isPressed ? Colors.white : Colors.black, backgroundColor: _isPressed ? const Color.fromARGB(255, 198, 185, 65) : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(widget.title),
      ),
    );
  }
}
class ProductItem extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;

  ProductItem({
    required this.title,
    required this.price,
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
                  '\$${price.toStringAsFixed(2)}',
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