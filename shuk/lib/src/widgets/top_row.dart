import 'dart:async';

import 'package:flutter/material.dart';

class TopRow extends StatefulWidget {
  const TopRow({
    Key key,
  }) : super(key: key);

  @override
  TopRowState createState() => TopRowState();
}

class TopRowState extends State<TopRow> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 450),
        curve: Curves.easeInCubic,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Image(
            image: AssetImage('assets/img/banners/anuncio.png'),
            fit: BoxFit.fill,
          ),
          Image(
            image: AssetImage('assets/img/banners/anuncio2.png'),
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
