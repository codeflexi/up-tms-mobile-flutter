import 'package:flutter/material.dart';
import 'package:flutter_ws_1/pages/tiktok/utils/post_template.dart';


class MyPost1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PostTemplate(
      username: 'createdbykoko',
      videoDescription: 'tiktok ui tutorial',
      numberOfLikes: '1.2M',
      numberOfComments: '1232',
      numberOfShares: '122',
      userPost: Container(
        color: Colors.deepPurple[300],
      ),
    );
  }
}
