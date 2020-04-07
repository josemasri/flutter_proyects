import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Bar'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya_400x400.jpg')),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            image: NetworkImage(
                'https://static01.nyt.com/images/2018/11/13/obituaries/13LEE3/13LEE3-videoSixteenByNineJumbo1600.jpg')),
      ),
    );
  }
}
