import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';

class SignatureInput extends StatefulWidget {

  const SignatureInput({super.key, required this.onPickSignature});
  final void Function(Uint8List image) onPickSignature;

  @override
  State<SignatureInput> createState() => _SignatureInputState();
}

class _SignatureInputState extends State<SignatureInput> {
  
  Uint8List? exportedImage;
  

  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.redAccent,
    exportBackgroundColor: Colors.black,


    
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Signature(
            controller: controller,
            width: 350,
            height: 150,
            backgroundColor: Colors.lightBlue[100]!,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () async {
                          exportedImage = await controller.toPngBytes();
                          //API
                          setState(() {
                           
                          });
       widget.onPickSignature(exportedImage!);
                        },
                        child: const Text(
                          "บันทึก ลายเซ็นต์",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.black))))),
                  )),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        controller.clear();
                      },
                      child: const Text(
                        "ล้าง",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red.shade400),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.red)))))),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          if (exportedImage != null)
            Image.memory(
              exportedImage!,
              width: 300,
              height: 250,
            )
        ],
      ),
    );
  }
}
