import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/photo/photo_input.dart';
import 'package:flutter_ws_1/src/features/pickup/models/pickup_detail.dart';

class PickupInputForm extends StatefulWidget {
  const PickupInputForm({super.key});

  @override
  State<PickupInputForm> createState() => _PickupInputFormState();
}

class _PickupInputFormState extends State<PickupInputForm> {
  final _titleController = TextEditingController();
  File? _selectedImage;
 PickupDetailDataModel?  pick ;

  void saveImage(File img) {
    setState(() {
      _selectedImage = img;
   pick = PickupDetailDataModel(image:img ,signature: img,pick_id: '233',pick_number: 'nuj;;');

    });
    print('Image Saved');
    print(pick!.pick_number.toString());
 
  }


  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      'No Image',
    );

    if (_selectedImage != null) {
      content = Image.file(
        pick!.image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                color: Colors.black12,
              ),
            ),
            const SizedBox(height: 10.0),
            PhotoInput(
              onPickImage: (image) {
                saveImage(image);
              },
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade400),
              ),
              height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
