import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/Load/models/load_data_model.dart';
import 'package:flutter_ws_1/src/features/Load/screens/load_detail.dart';
import 'package:flutter_ws_1/src/features/pickup/bloc/shipment_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/pickup_action.dart';

class LoadHomePage extends StatelessWidget {
  LoadHomePage({super.key});
  final ShipmentBloc shipmentsBloc = ShipmentBloc();

  var _isButtonDisabled = true;
  @override
  Widget build(BuildContext context) {
    // Get Value from previouse screen
    final load =
        ModalRoute.of(context)!.settings.arguments as LoadDataModel;

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
              Text(load.load_number,style: Theme.of(context).textTheme.headline6),
              Text(load.customer_name),
              Text(load.load_momo),
              Text(load.load_id),
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
                    PickupAction(pickId: load.load_id,formPage: 'load',),
                    //2nd Tab
                    LoadDetailPage(pickId: load.load_id),

                   

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
