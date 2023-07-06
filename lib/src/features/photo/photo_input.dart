import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import 'dart:typed_data';

class PhotoInput extends StatefulWidget {
   const PhotoInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;
 

  @override
  State<PhotoInput> createState() => _PhotoInputState();
}

class _PhotoInputState extends State<PhotoInput> {
  File? _selectedImage;
  File? _image;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }
   setState(() {
      _selectedImage = File(pickedImage.path);
    });

    widget.onPickImage(_selectedImage!);
// Converst to base64
  }
  void _getImageBase64() async {
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: () => {_takePicture()},
      icon: const Icon(Icons.camera),
      label: Text('กดปุ่ม เพื่อถ่ายภาย',style: Theme.of(context).textTheme.headline1),
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade400),
      ),
      height: 200,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
