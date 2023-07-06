import 'package:flutter/material.dart';

class StatelessFul extends StatefulWidget {
  const StatelessFul({super.key});

// Create middleware state to keep writing Widget
  @override
  State<StatelessFul> createState() => _StatelessFulState();
}

class _StatelessFulState extends State<StatelessFul> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
            title: Text("Nike Shoes"),
            trailing: IconButton(
              icon: liked? (Icon(Icons.favorite)) : (Icon(Icons.favorite_border)) ,
              onPressed: ()
               {
                 setState( () => liked = !liked );
               },
            ),
            ),
      ],
    );
  }
}
