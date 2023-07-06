import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/models/pickup_cart.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:meta/meta.dart';

part 'shipment_cart_event.dart';
part 'shipment_cart_state.dart';

class ShipmentCartBloc extends Bloc<ShipmentCartEvent, ShipmentCartState> {
  ShipmentCartBloc() : super(ShipmentCartInitial()) {
  
    on<ShipmentCartInitialEvent>(shipmentCartInitialEvent);
    on<ShipmentCartRemoveFromCartEvent>(shipmentCartRemoveFromCartEvent);

}
  FutureOr<void> shipmentCartInitialEvent(ShipmentCartInitialEvent event, Emitter<ShipmentCartState> emit) {
    // assign pickupCarts to state
    emit(ShipmentCartSuccessState(pickupCarts: pickupCarts));
  }


  FutureOr<void> shipmentCartRemoveFromCartEvent(ShipmentCartRemoveFromCartEvent event, Emitter<ShipmentCartState> emit) {
// remove from Cart
 pickupCarts.remove(event.shipmentDataModel);
 //emit
 emit(ShipmentCartSuccessState(pickupCarts: pickupCarts));
  }
}