import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shuk/src/models/producto_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductoModel product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 56, 56, 1),
        title: Text('Titulo producto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: product.id,
              child: Container(
                height: 200,
                child: PageView(
                  children: [
                    Image(
                      image: AssetImage('assets/img/products/product1.jpg'),
                    ),
                    Image(
                      image: AssetImage('assets/img/products/product1.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Categorías:',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CustomChip('Moda', FontAwesomeIcons.tshirt),
                SizedBox(
                  width: 20,
                ),
                CustomChip('Accesorios', FontAwesomeIcons.broadcastTower),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\$950',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Tempor proident et proident commodo culpa adipisicing. Eu amet occaecat sint eu. Incididunt amet irure est esse deserunt velit.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Reviews(),
          ],
        ),
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(
            color: Colors.white,
          ),
          Text(
            'Opiniones sobre el producto',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                '4.5',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SmoothStarRating(
                    allowHalfRating: true,
                    rating: 4.4,
                  ),
                  Text(
                    'Promedio ente 50 opiniones',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              MaterialButton(
                child: Icon(
                  Icons.rate_review,
                  color: Colors.white,
                ),
                color: Colors.red,
                onPressed: () {},
              )
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          ...getUserReview(),
          ...getUserReview(),
          ...getUserReview(),
        ],
      ),
    );
  }

  List<Widget> getUserReview() {
    return [
      SizedBox(height: 20),
      Row(
        children: <Widget>[
          CircleAvatar(
            child: Icon(Icons.person),
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '\"Excelente producto\"',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Et in proident aliquip sunt magna est officia deserunt esse in do. Esse do tempor aute excepteur cillum minim qui enim consectetur tempor voluptate do reprehenderit eu. Laboris commodo deserunt enim irure irure ipsum. Aute ipsum velit fugiat irure sit fugiat sunt labore consequat. Veniam magna qui quis sunt magna elit esse ad enim voluptate ipsum.',
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'por Jose Masri.',
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
      Divider(
        color: Colors.white,
      ),
    ];
  }
}

class CustomChip extends StatelessWidget {
  final String texto;
  final IconData icono;

  const CustomChip(this.texto, this.icono);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        texto,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
      avatar: Icon(
        icono,
        color: Colors.white,
        size: 15,
      ),
      backgroundColor: Color.fromRGBO(255, 0, 0, 0.7),
    );
  }
}
