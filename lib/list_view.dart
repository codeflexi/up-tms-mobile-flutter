import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TListView extends StatelessWidget {
  const TListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        itemExtent: 100.0,
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.alarm_on_sharp),
              backgroundColor: Colors.blue,
            ),
            title: Text("Sales"),
            subtitle: Text("Sale of the week"),
            trailing: Icon(Icons.add),
            onTap: () {},
            tileColor: Colors.brown.shade50,
          ),
          ListTile(
              leading: Icon(Icons.alarm_on_sharp),
              title: Text("Sales"),
              subtitle: Text("Sale of the week"),
              trailing: Icon(Icons.add))
        ],
      ),
    ));
  }
}
