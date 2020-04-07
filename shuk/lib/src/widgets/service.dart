import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final String image;
  final String title;

  const Service(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: FadeInImage(
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: AssetImage(image),
                image: AssetImage(image),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
