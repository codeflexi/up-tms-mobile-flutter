import 'package:flutter/material.dart';

class ListGrid extends StatefulWidget {
  const ListGrid({super.key});

  @override
  State<ListGrid> createState() => _ListGridState();
}

class _ListGridState extends State<ListGrid> {
  List<String> fruits = ['Orange', 'Apple', 'Mango', 'Banana'];
  Map  fruitsPerson = {
    'fruits': ['Orange', 'Apple', 'Mango', 'Banana'],
    'names': ['Karan', 'Akshit', 'Gaurav', 'Aasif'],
    'prices': [100, 2000, 3000, 4000],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List and Grid'),
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: Container(
          child: ListView.builder(
            itemCount: fruits.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    print((fruitsPerson['fruits'][index]));
                  },
                  leading: const Icon(Icons.person),
                  title: Text(fruitsPerson['fruits'][index]),
                  subtitle: Text(fruitsPerson['names'][index]),
                  trailing: Text(fruitsPerson['names'][index]),
                ),
              );
            },
          ),
        ));
  }
}
