import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/pickup/bloc/shipment_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/models/pickup.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/pickup_action.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/pickup_detail.dart';

class PickupHomePage extends StatelessWidget {
  PickupHomePage({super.key});
  final ShipmentBloc shipmentsBloc = ShipmentBloc();

  var _isButtonDisabled = true;
  @override
  Widget build(BuildContext context) {
    // Get Value from previouse screen
    final pickup =
        ModalRoute.of(context)!.settings.arguments as PickupDataModel;

    return DefaultTabController(
     length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black54,
            elevation: 0,
            title: const Text("รับของจากคลัง"),
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
              Text(pickup.pick_number,style: Theme.of(context).textTheme.headline6),
              Text(pickup.customer_name),
              Text(pickup.pick_momo),
              Text(pickup.pick_id),
            const SizedBox(
                height: 10,
              ),
              const TabBar(
                tabs: [
                  Tab(
                    
                    icon: Icon(
                      Icons.token,
                      color: Colors.black87,
                      size: 30,
                    ),
                  ),
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
                    PickupAction(pickId: pickup.pick_id,formPage: 'pick',),
                    //2nd Tab
                    PickupDetailPage(pickId: pickup.pick_id),

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
