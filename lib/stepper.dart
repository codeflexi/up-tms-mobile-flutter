import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import "package:flutter/material.dart";
import 'package:flutter_ws_1/src/constants/text_strings.dart';
import 'package:flutter_ws_1/src/features/photo/photo_input.dart';
import 'package:flutter_ws_1/src/features/photo/pickup_input_form.dart';
import 'package:flutter_ws_1/src/features/photo/signature_input.dart';
import 'package:flutter_ws_1/src/features/pickup/models/pickup_detail.dart';
import 'package:flutter_ws_1/src/features/pickup/repos/pickups_repo.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/pickup_list.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;
  bool isCompleted = false;
  File? _selectedImage;
  Uint8List? _selectSignature;
  PickupDetailDataModel?  pick ;

  Future<String> convertBase64() async {
  
       Uint8List imagebytes =
        await _selectedImage!.readAsBytes(); // convert to bytes
        String base64string = base64Encode(imagebytes);
        return base64string;
        
  }


  void handleUpdatePicking() async {
    List<String> shipments = ['63f1c5f287b8850fc6e493e9','63f1c5f887b8850fc6e493f9'];
    String id = '63f34d769a9509ad57516dfe';


    bool result =  await PickupsRepo.updatePickup(id,_selectedImage!,_selectSignature!,shipments);
if (result) {
     Navigator.push(context, MaterialPageRoute(builder: (context)=> PickupList()));
}
  }

 

  void saveSignature(Uint8List img) {
    setState(() {
      _selectSignature = img;

    });
    print('Image Saved');
    print(pick!.pick_number.toString());
 
  }

  void saveImage(File img) {
    setState(() {
      _selectedImage = img;
       pick = PickupDetailDataModel(image:img ,signature: img,pick_id: '233',pick_number: 'nuj;;');
      currentStep = 1;
    });
    print('Image Saved');
  }

  List<Step> buildStep() {
    return [
      Step(
         state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
        title: const Text('Take a Photo'),
        content: PhotoInput(onPickImage: (image) {
          saveImage(image);
        }),
      ),
      Step(
        title: const Text('Signature'),
        content: SignatureInput(onPickSignature: (signature){
          saveSignature(signature);
        },),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: isCompleted
            ? buildCompleted()
        : 
        Stepper(
            steps: buildStep(),
            type: StepperType.vertical,
            currentStep: currentStep,
            
            onStepCancel: () {
              if (currentStep > 0) {
                setState(() {
                  currentStep -= 1;
                });
              }
            },
            onStepContinue: () {
                    final isLastStep = currentStep == buildStep().length - 1;

                    if (isLastStep) {
                      setState(() => isCompleted = true);
                      print('Completed');

                      /// send data to server
                    } else {
                      setState(() => currentStep += 1);
                    }
                  },
            onStepTapped: (int index) {
              setState(() {
                currentStep = index;
              });
            },
            
            ),


            );
  }

Widget buildCompleted() => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 52),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_done, color: Colors.blue, size: 120),
            const SizedBox(height: 8),
            Text(
              'ยืนยันการบันทึกข้อมูล ?',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 64),

        Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () {
                      print("บันทึก");
                    },
                    child: Text(tCancel.toUpperCase()),
                  )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () 
                    {
                      setState(() {
                        isCompleted = false;
                        currentStep = 0;
                      });
                      handleUpdatePicking();
                      print("CANCEL");
                    },
                    child: Text(tSave.toUpperCase()),
                  ),
                  ),
                ],
              )

            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.black,
            //     textStyle: TextStyle(fontSize: 24),
            //     minimumSize: Size.fromHeight(50),
            //   ),
            //   child: Text('Cancel'),
            //   onPressed: () => setState(() {
            //     isCompleted = false;
            //     currentStep = 0;

            //     // firstName.clear();
            //     // lastName.clear();
            //     // address.clear();
            //     // postcode.clear();
            //   }),
            // ),



          ],
        ),
      );


}
