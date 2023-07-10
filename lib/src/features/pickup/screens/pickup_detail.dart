import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ws_1/src/constants/text_strings.dart';
import 'package:flutter_ws_1/src/features/photo/photo_input.dart';
import 'package:flutter_ws_1/src/features/photo/signature_input.dart';
import 'package:flutter_ws_1/src/features/pickup/bloc/shipment_bloc.dart';

import 'package:flutter_ws_1/src/features/pickup/models/pickup_detail.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';

import 'package:flutter_ws_1/src/features/pickup/repos/pickups_repo.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/pickup_list.dart';

import '../bloc/bloc_shipment/shipment_cart_bloc.dart';

class PickupDetailPage extends StatefulWidget {
  final String pickId;
  const PickupDetailPage({super.key, required this.pickId});

  @override
  State<PickupDetailPage> createState() => _PickupDetailPageState();
}

class _PickupDetailPageState extends State<PickupDetailPage> {
  int currentStep = 0;
  bool isCompleted = false;
  File? _selectedImage;
  Uint8List? _selectSignature;
  PickupDetailDataModel? pick;
  final ShipmentCartBloc shipmentCartBloc = ShipmentCartBloc();
  final ShipmentBloc shipmentsBloc = ShipmentBloc();

  @override
  void initState() {
    // TODO: implement initState
    shipmentCartBloc.add(ShipmentCartInitialEvent());
    super.initState();
  }

  void handleUpdatePicking(List<ShipmentDataModel> ships) async {
    //  List<ShipmentDataModel> shipments = [];
    List data = ships;


     //loading circle
   showDialog(
    context: context,
    builder: (context) {
return Center(child: CircularProgressIndicator());
    },
   );

// Loop and create Array
    List<String> shipArr = [];
    var shipments = ships.map((ship) {
      shipArr.add(ship.shipment_id);
    }).toString();

    if (shipArr.length < 1) {
      tShowDialog();
      return;
    }
    print(shipArr.length);

    //String shipments = result;

    bool result = await PickupsRepo.updatePickup(
        widget.pickId, _selectedImage!, _selectSignature!, shipArr);
    if (result) {
      shipmentsBloc.add(ClearPickupCartEvent());
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PickupList()));

           ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
    content: Text('บันทึกข้อมูลสำเร็จ !!!'),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        right: 20,
        left: 20),
  ));


    } else {
      tShowDialog();
      return;
    }
  }

  void tShowDialog() {
    //MyDialog(titleText: 'พบข้อผิดพลาด',contentText: 'โปรด ตรวจสอบ รหัสผ่านอีกครั้ง!!',context: context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('พบข้อผิดพลาด'),
        content: const Text('โปรดเลือก Shipments ที่จะทำการเข้ารับ !!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('ตกลง'),
          ),
        ],
      ),
    );
  }

  void saveSignature(Uint8List img) {
    setState(() {
      _selectSignature = img;
       isCompleted = true;
       
    });
  
  }

  void saveImage(File img) {
    setState(() {
      _selectedImage = img;
    currentStep = 1;
    });
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
        content: SignatureInput(
          onPickSignature: (signature) {
            saveSignature(signature);
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCompleted
          ? buildCompleted()
          : Stepper(
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

  Widget buildCompleted() => BlocConsumer<ShipmentCartBloc, ShipmentCartState>(
        bloc: shipmentCartBloc,
        listenWhen: ((previous, current) => current is ShipmentCartActionState),
        buildWhen: ((previouse, current) =>
            current is! ShipmentCartActionState),
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ShipmentCartSuccessState:
              final successState = state as ShipmentCartSuccessState;

              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 52),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_done,
                        color: Colors.black, size: 120),
                    const SizedBox(height: 8),
                    const Text(
                      'ยืนยันการบันทึกข้อมูล ?',
                      style: TextStyle(
                        fontSize: 25,
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
                              setState(() {
                                isCompleted = false;
                                currentStep = 0;
                              });
                            
                          },
                          child: Text(tCancel.toUpperCase()),
                        )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isCompleted = false;
                                currentStep = 0;
                              });
                              handleUpdatePicking(successState.pickupCarts);
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
                    //   },
                    //   ),
                    // ),
                  ],
                ),
              );
            default:
              //return const SizedBox();
              return Text(state.runtimeType.toString());
              print('State');
              print(state.runtimeType.toString());
          }
        },
      );
}
