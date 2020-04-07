import 'package:flutter/material.dart';

import 'package:widget_week/src/pages/home_page.dart';
import 'package:widget_week/src/pages/safe_area_page.dart';
import 'package:widget_week/src/pages/expanded_page.dart';
import 'package:widget_week/src/pages/wrap_page.dart';
import 'package:widget_week/src/pages/animated_container_page.dart';
import 'package:widget_week/src/pages/opacity_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'safeArea': (context) => SafeAreaPage(),
        'expanded': (context) => ExpandedPage(),
        'wrap': (context) => WrapPage(),
        'animatedContainer': (context) => AnimatedContainerPage(),
        'opacity': (context) => OpacityPage(),
      },
    );
  }
}
