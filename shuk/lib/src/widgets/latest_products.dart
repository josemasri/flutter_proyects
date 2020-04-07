import 'package:flutter/material.dart';
import 'package:shuk/src/widgets/product.dart';

class LatestProducts extends StatefulWidget {
  const LatestProducts({
    Key key,
  }) : super(key: key);

  @override
  _LatestProductsState createState() => _LatestProductsState();
}

class _LatestProductsState extends State<LatestProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: PageView(
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        pageSnapping: false,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Product('assets/img/products/product1.jpg', 'Collar', 500),
          Product('assets/img/products/product2.jpg', 'Collar', 100),
          Product('assets/img/products/product3.jpg', 'Collar', 200),
          Product('assets/img/products/product1.jpg', 'Collar', 100),
          Product('assets/img/products/product2.jpg', 'Collar', 500),
          Product(
              'assets/img/products/product3.jpg', 'Collar de perlas Inglesas', 200),
        ],
      ),
    );
  }
}
