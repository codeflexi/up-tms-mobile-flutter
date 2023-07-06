import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/bloc/bloc_shipment/shipment_cart_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/bloc/shipment_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:flutter_ws_1/src/features/pickup/utils/shipment_tile.dart';

class ShipmentCart extends StatefulWidget {
  const ShipmentCart({super.key});

  @override
  State<ShipmentCart> createState() => _ShipmentCartState();
}

class _ShipmentCartState extends State<ShipmentCart> {
  final ShipmentCartBloc shipmentCartBloc = ShipmentCartBloc();
  //final ShipmentBloc shipmentsBloc = ShipmentBloc();
  @override
  void initState() {
    // TODO: implement initState
    shipmentCartBloc.add(ShipmentCartInitialEvent());
    super.initState();
  }

   //remove shipment to pickup cart
  void addToCart(ShipmentDataModel pickup){
    shipmentCartBloc.add(ShipmentCartRemoveFromCartEvent(shipmentDataModel: pickup ));

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<ShipmentCartBloc, ShipmentCartState>(
      bloc: shipmentCartBloc,
      listenWhen: ((previous, current) => current is ShipmentCartActionState),
      buildWhen: ((previouse, current) => current is! ShipmentCartActionState),
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case ShipmentCartSuccessState:
            final successState = state as ShipmentCartSuccessState;
            return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
// heading message successState.shipments.length
                    Text(
                      "รายการที่เข้ารับ จำนวน " + successState.pickupCarts.length.toString(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),

//list of shipments
                    Expanded(
                        child: ListView.builder(
                      itemCount: successState.pickupCarts.length,
                      itemBuilder: (context, index) {
                        ShipmentDataModel eachShipment =
                            successState.pickupCarts[index];

                        // return the tile for this shipments
                        return ShipmentTile(
                          myIcon: Icons.delete_outline_outlined,
                          IconColor:  Color.fromARGB(255, 147, 22, 13),
                          shipment: eachShipment,
                          onPressed: () => {addToCart(eachShipment)},
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
