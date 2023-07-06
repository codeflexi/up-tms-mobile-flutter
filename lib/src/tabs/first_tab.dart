import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class FirstTabPage extends StatelessWidget {
  const FirstTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    //1st Tab
                    Container(
                      color: Colors.blue,
                      child: Center(child: Text('1ST Tab',style: TextStyle(fontSize: 30),)),
                    );
  }
}