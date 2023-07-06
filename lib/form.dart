import "package:flutter/material.dart";
import 'package:flutter_ws_1/details.dart';
import 'package:flutter_ws_1/src/comon_widgets/my_text_field.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  var _productName;

  final _productController = TextEditingController();
  final _productDecController = TextEditingController();
  final _userNameController = TextEditingController();

  bool? _checkBox = false;
  bool? _listTilecheckBox = false;
  @override
  void dispose() {
    _productController.dispose();
    _productDecController.dispose();
    super.dispose();
  }

// @override
// void initState() {
//   super.initState();
//   _productController.addListener(_updateText);
// }

// void _updateText(){
//   setState(() {
//     _productName = _productController.text;
//   });
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(40.0),
          child: ListView(
            children: [
              TextFormField(
                controller: _productController,
                decoration: InputDecoration(
                    labelText: 'Product Name',
                    prefixIcon: Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _productDecController,
                decoration: InputDecoration(
                    labelText: 'Product Description',
                    prefixIcon: Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10.0,
              ),
              MyTextField(
                  fieldName: "UserName", myController: _userNameController),
              SizedBox(
                height: 10.0,
              ),

              // Two types of CheckBox .....
              //1. CheckBox
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.red.shade300,
                  tristate: true,
                  value: _checkBox,
                  onChanged: (val) {
                    setState(() {
                      _checkBox = val;
                    });
                  }),

//2. CheckBoxListTile
              CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.red.shade300,
                tristate: true,
                value: _listTilecheckBox,
                title: Text("Top Product"),
                onChanged: (val) {
                  setState(() {
                    _listTilecheckBox = val;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),

//Radio Button

/* 
* 1. Create 2 Types of Radio Buttons
* 2. setState() to update
* 3. Custom Widget Stateless => setState() in this.class



*/

Radio(value: null, groupValue: null, onChanged: null),
RadioListTile(value: null, groupValue: null, onChanged: null),

              SizedBox(
                height: 20.0,
              ),
              Mybtn(context),
            ],
          )),
    );
  }

  OutlinedButton Mybtn(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Details(
              productName: _userNameController.text,
            );
          }));
        },
        child: Text(
          "Submit Form".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
