import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String image;
  final String title;
  final double price;

  const Product(this.image, this.title, this.price);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'product');
      },
      child: Hero(
        tag: 1,
        child: Card(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: FadeInImage(
                    height: 80,
                    fit: BoxFit.cover,
                    placeholder: AssetImage(image),
                    image: AssetImage(image),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
