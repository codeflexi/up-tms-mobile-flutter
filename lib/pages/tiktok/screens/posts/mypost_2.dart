import 'package:flutter/material.dart';
import 'package:flutter_ws_1/pages/tiktok/utils/post_template.dart';


class MyPost2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PostTemplate(
      username: 'zuckerberg',
      videoDescription: 'reels for days',
      numberOfLikes: '1.2M',
      numberOfComments: '232',
      numberOfShares: '122',
      userPost: Container(
        color: Colors.pink[300],
      ),
    );
  }
}
