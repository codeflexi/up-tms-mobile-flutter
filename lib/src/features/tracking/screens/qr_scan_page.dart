import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ws_1/src/comon_widgets/my_button.dart';
import 'package:flutter_ws_1/src/constants/text_strings.dart';
import 'package:flutter_ws_1/src/features/pickup/bloc/shipment_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:flutter_ws_1/src/features/pickup/pickup_home/bloc/pickup_home_bloc.dart';

class QrScanPage extends StatefulWidget {
  final String pickId;
  final String fromPage;
  const QrScanPage({super.key, required this.pickId, required this.fromPage});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final ShipmentBloc shipmentsBloc = ShipmentBloc();
  final PickupHomeBloc pickupHomeBloc = PickupHomeBloc();
  // final _shipmentController = TextEditingController();
  var _shipmentController = TextEditingController();
  var isShipmentAddedtoCart = false;
   var _isButtonDisabled = true;
  

  @override
  void dispose() {
    _shipmentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shipmentsBloc.add(ShipmentsInitialFetchByDriverEvent(
        pickId: widget.pickId, fromPage: widget.fromPage));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: ListView(children: [
          BlocConsumer<ShipmentBloc, ShipmentState>(
            bloc: shipmentsBloc,
            listenWhen: ((previous, current) => current is ShipmentActionState),
            buildWhen: ((previouse, current) =>
                current is! ShipmentActionState),
            listener: (context, state) {
              // TODO: implement listener
              if (state is ShipmenPickupItemCartActionState) {
                // final  s = state as ShipmenPickupItemCartActionState;
                // pint(s.tosting());
             ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
    content: Text('Successfully Added to Cart'),
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


              }
              ;

              
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case ShipmentFetchingLoadingState:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ShipmentFectchingSuccessfulState:
                  final successState =
                      state as ShipmentFectchingSuccessfulState;
                  return Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter  WayBill# or scan QR code Total : ' +
                              successState.shipments.length.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 7,
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 49,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                  child: TextField(
                                    textInputAction: TextInputAction.go,
  onSubmitted: (value) {
    print("go clicked");
      // _isButtonDisabled ? null: saveData
                                    if (_shipmentController.text.isNotEmpty) {
                                      print('Track');
                                      getShipment(successState.shipments,
                                          _shipmentController.text);
                                    }
  },
  autofocus: true,

                                    controller: _shipmentController,
                                    decoration: InputDecoration(
                                     contentPadding: EdgeInsets.all(10.0),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('Scannnnnn');
                                  scanQRCode();
                                },
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    width: 50,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.red[800],
                                    ),
                                    child: Icon(
                                      Icons.qr_code,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Center(
                              child: Container(
                                  height: 100,
                                  width: 300,
                                  color: Colors.deepPurple[300],
                                  child: _shipmentController.text != '-1'
                                      ? Center(
                                          child: Text(
                                          _shipmentController.text,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                          ),
                                        ))
                                      : Center(
                                          child: Text(
                                          'ไม่พบข้อมูล',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                          ),
                                        ))),
                            ),
                          ),
                        ),
                        _shipmentController.text != '-1' &&
                                !isShipmentAddedtoCart
                            ? SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    // _isButtonDisabled ? null: saveData
                                    if (_shipmentController.text.isNotEmpty) {
                                      print('Track');
                                      getShipment(successState.shipments,
                                          _shipmentController.text);
                                    }
                                  },
                                  child: Text(
                                    tSave,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black)),
                                ),
                              )
                            : SizedBox(height: 48),
                      ],
                    ),
                  );
                default:
                  return const SizedBox();
              }
            },
          ),
        ]),
      ),
    );
  }
  

  var getResult = 'QR Code Result';

  void getShipment(List<ShipmentDataModel> shipments, String waybillNumber) {
    // Return list of people matching the condition
    final foundShipment =
        shipments.where((element) => element.waybill_number == waybillNumber);
    if (foundShipment.isNotEmpty) {
      shipmentsBloc.add(ShipmentPickupCartButtonClickedEvent(
          pickupCart: foundShipment.first));
      setState(() {
        _shipmentController.text = '';
        isShipmentAddedtoCart = true;
      }
      );
    } else {
       final foundShipmentNumber =
        shipments.where((element) => element.shipment_number == waybillNumber);
        if (foundShipmentNumber.isNotEmpty) {
      shipmentsBloc.add(ShipmentPickupCartButtonClickedEvent(
          pickupCart: foundShipmentNumber.first));
      setState(() {
        _shipmentController.text = '';
        isShipmentAddedtoCart = true;
      }
      );
    }

    }
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
        _shipmentController.text = getResult;
      });
    } on PlatformException {
      getResult = 'Failed to scan QR Code';
    }
  }
}
