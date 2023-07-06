import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ws_1/src/features/auth/home/home_landing_page.dart';
import 'package:flutter_ws_1/src/features/delivery/bloc/delivery_bloc.dart';
import 'package:flutter_ws_1/src/features/delivery/utils/delivery_tile.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:flutter_ws_1/src/features/pickup/utils/shipment_tile.dart';

class DeliveryListPage extends StatefulWidget {
  const DeliveryListPage({super.key});

  @override
  State<DeliveryListPage> createState() => _DeliveryListPageState();
}


class _DeliveryListPageState extends State<DeliveryListPage> {
  final DeliveryBloc deliveryBloc = DeliveryBloc();

  @override
  void initState() {
    // TODO: implement initState
    deliveryBloc.add(DeliveryInitialFetchEvent());
    super.initState();
  }

  void goToDetail(ShipmentDataModel shipment) {
  
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<DeliveryBloc, DeliveryState>(
      bloc: deliveryBloc,
      listenWhen: ((previous, current) => current is DeliveryActionState),
      buildWhen: ((previouse, current) => current is! DeliveryActionState),
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case DeliveryListFetchingLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case DeliveryListFetchingSuccessfulState:
            final successState = state as DeliveryListFetchingSuccessfulState;
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                title: const Text("D E L I V E R Y"),
              leading:IconButton(
            icon: Icon(Icons.home),
              onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeLandingPage();
          }));

              }),
            
            ),
         
              body:  Scrollbar(
              
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:  Column(
                      children: [
                        // heading message successState.shipments.length
                        Text(
                          "เลือก เพื่อส่งของจาก " +
                              successState.shipments.length.toString() +
                              " รายการ",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
              
                        //list of shipments
                        Expanded(
                            child: ListView.builder(
                          itemCount: successState.shipments.length,
                          itemBuilder: (context, index) {
                            ShipmentDataModel eachLoad =
                                successState.shipments[index];
              
                            // return the tile for this shipments
                            return DeliveryTile(
                              shipment: eachLoad,
                              onPressed: () => goToDetail(eachLoad),
                            );
                          },
                        ))
                      ],
                    )),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    ));
  }
}
