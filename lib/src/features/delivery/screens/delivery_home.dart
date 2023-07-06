import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/Load/models/load_data_model.dart';
import 'package:flutter_ws_1/src/features/Load/screens/load_detail.dart';
import 'package:flutter_ws_1/src/features/delivery/screens/delivery_detail.dart';
import 'package:flutter_ws_1/src/features/pickup/bloc/shipment_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/models/pickup.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/pickup_action.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/pickup_detail.dart';

class DeliveryHomePage extends StatelessWidget {
  DeliveryHomePage({super.key});
  final ShipmentBloc shipmentsBloc = ShipmentBloc();

  var _isButtonDisabled = true;
  @override
  Widget build(BuildContext context) {
    // Get Value from previouse screen
    final shipment =
        ModalRoute.of(context)!.settings.arguments as ShipmentDataModel;

    return DefaultTabController(
     length: 1,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black54,
            elevation: 0,
            title: const Text("ส่งของให้ลูกค้า"),
            leading: IconButton(
                onPressed: () {
                  // Cear shipment card data
                  shipmentsBloc.add(ClearPickupCartEvent());
                  Navigator.pop(context);
                },
                icon: const  Icon(Icons.arrow_back)),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(shipment.waybill_number),
              Text(shipment.customer_name),
              Text(shipment.shipment_number),
              Text(shipment.shipment_id),
            const SizedBox(
                height: 10,
              ),
              const TabBar(
                tabs: [
             
                  Tab(
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.black87,
                      size: 30,
                    ),
                  ),
                  // Tab(icon:Icon(Icons.draw,color: Colors.black87,size: 30,),),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
               Expanded(
                child: TabBarView(
                  children: [
                  
                    //2nd Tab
                    DeliveryDetailPage(shipmentId: shipment.shipment_id,),

                    //3th Tab
                  ],
                ),
              ),

              //   GestureDetector(
              //   onTap: _isButtonDisabled ? null: saveData,
              //   child: Container(
              //     padding: const EdgeInsets.all(10),
              //     margin: const EdgeInsets.symmetric(horizontal: 15),
              //     decoration: BoxDecoration(
              //       color: Colors.black87,
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     child: const Center(
              //       child: Text(
              //         'ยืนยัน การเขัารับสินค้า',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              //          SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
