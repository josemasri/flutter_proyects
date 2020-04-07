import 'package:flutter/material.dart';
import 'package:shuk/src/widgets/service.dart';

class LatestServices extends StatefulWidget {
  const LatestServices({
    Key key,
  }) : super(key: key);

  @override
  _LatestServicesState createState() => _LatestServicesState();
}

class _LatestServicesState extends State<LatestServices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.5,
        ),
        pageSnapping: false,
        children: <Widget>[
          Service('assets/img/services/service1.jpg', 'Spa'),
          Service('assets/img/services/service2.jpg', 'Gimnasio'),
          Service('assets/img/services/service3.jpg', 'Clases'),
          Service('assets/img/services/service1.jpg', 'Collar'),
          Service('assets/img/services/service2.jpg', 'Collar'),
          Service(
              'assets/img/services/service3.jpg', 'Collar de perlas Inglesas'),
        ],
      ),
    );
  }
}
