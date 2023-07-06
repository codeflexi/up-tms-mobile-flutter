import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GestureDectectorPage extends StatefulWidget {
  const GestureDectectorPage({super.key});

  @override
  State<GestureDectectorPage> createState() => _GestureDectectorPageState();
}

class _GestureDectectorPageState extends State<GestureDectectorPage> {
  int numberOfTimesTapped = 0;

// method
  void _increaseNumber() {
    setState(() {
      numberOfTimesTapped = numberOfTimesTapped + 1;
    });
  }

  // GastureDetector is a tabalbe widget

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _increaseNumber,
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Tapped ' + numberOfTimesTapped.toString() + ' times',
                style: TextStyle(fontSize: 30)),
            
          ],
        )),
      ),
    );
  }
}


  // return Center(
  //       child: Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       Text('Tapped ' + numberOfTimesTapped.toString() + ' times',
  //           style: TextStyle(fontSize: 30)),
  //       GestureDetector(
  //         onTap: _increaseNumber,
  //         child: Container(
  //           padding: EdgeInsets.all(15),
  //           color: Colors.green[200],
  //           child: Text('TAP HERE', style: TextStyle(fontSize: 30)),
  //         ),
  //       )
  //     ],
  //   ));