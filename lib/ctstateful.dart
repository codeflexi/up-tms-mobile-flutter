import "package:flutter/material.dart";

class CTStatefulClass extends StatefulWidget {
  const CTStatefulClass({super.key});

// Set State and keep re render Wigets
  @override
  State<CTStatefulClass> createState() => _CTStatefulClassState();
}

class _CTStatefulClassState extends State<CTStatefulClass> {
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