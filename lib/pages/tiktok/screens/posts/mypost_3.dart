import 'package:flutter/material.dart';
import 'package:flutter_ws_1/pages/tiktok/utils/post_template.dart';


class MyPost3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PostTemplate(
      username: 'randomUser',
      videoDescription: 'flutter tutorial',
      numberOfLikes: '1.2B',
      numberOfComments: '232',
      numberOfShares: '122',
      userPost: Container(
        color: Colors.blue[300],
      ),
    );
  }
}
