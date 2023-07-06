import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/bloc/shipment_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:flutter_ws_1/src/features/pickup/pickup_home/bloc/pickup_home_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/utils/shipment_tile.dart';
import 'package:flutter/material.dart';


class ShipmentListPage extends StatefulWidget {
  const ShipmentListPage({super.key,required this.pickId, required this.fromPage});
  final String pickId ;
  final String fromPage;


  @override
  State<ShipmentListPage> createState() => _ShipmentListPageState();
}

class _ShipmentListPageState extends State<ShipmentListPage> {
  final ShipmentBloc shipmentsBloc = ShipmentBloc();
  final PickupHomeBloc pickupHomeBloc = PickupHomeBloc();

  @override
  void initState() {
     //apiCall();
    super.initState();
  shipmentsBloc.add(ShipmentsInitialFetchEvent(pickId: widget.pickId,fromPage: widget.fromPage));
  //   // TODO: implement initState
  //    WidgetsBinding.instance.addPostFrameCallback((_) {
  //    Future.delayed(Duration(seconds: 3), () => bindingState());
  //    });
   }

  //add shipment to pickup cart
  void addToCart(ShipmentDataModel pickup) {
    shipmentsBloc.add(ShipmentPickupCartButtonClickedEvent(pickupCart: pickup));
    // Delete from homeList
    shipmentsBloc.add(ShipmentRemovedfromListEvent(shipments: pickup));
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: BlocConsumer<ShipmentBloc, ShipmentState>(
      bloc: shipmentsBloc,
      listenWhen: ((previous, current) => current is ShipmentActionState),
      buildWhen: ((previouse, current) => current is! ShipmentActionState),
      listener: (context, state) {
        // TODO: implement listener
        if (state is ShipmenPickupItemCartActionState) {
          // final  s = state as ShipmenPickupItemCartActionState;
          // pint(s.tosting());
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Pickup Carted')));
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
            final successState = state as ShipmentFectchingSuccessfulState;
            return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
// heading message successState.shipments.length
                    Text(
                      "กดเครื่องหมาย '+' เพื่อเลือก",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),

//list of shipments
                    Expanded(
                        child: ListView.builder(
                      itemCount: successState.shipments.length,
                      itemBuilder: (context, index) {
                        ShipmentDataModel eachShipment =
                            successState.shipments[index];

                        // return the tile for this shipments
                        return ShipmentTile(
                          shipment: eachShipment,
                          onPressed: () => addToCart(eachShipment),
                        );
                      },
                    ))
                  ],
                ));
          default:
            return const SizedBox();
        }
      },
    ));
  }
}

//itemCount : listResponse ==null?0:listResponse.length,
//Text(listResponse[index]['id'].toString())

// For Loop

// List data = jsonDecode(response.body);
// data.forEach((element)) {
//   Map obj = element;
//   String name = obj['name'];
//  Map address = obj['address'];
//  String street = address['street']
//  String geo = address['geo'];
//  Sgring lat = geo['lat']
// }