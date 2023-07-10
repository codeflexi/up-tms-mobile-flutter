import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/pickup/models/pickup_cart.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:flutter_ws_1/src/features/pickup/repos/shipments_repo.dart';
part 'shipment_event.dart';
part 'shipment_state.dart';

class ShipmentBloc extends Bloc<ShipmentEvent, ShipmentState> {
  ShipmentBloc() : super(ShipmentInitial()) {
    on<ShipmentsInitialFetchEvent>(shipmentsInitialFetchEvent);
    on<ShipmentsInitialFetchByDriverEvent>(shipmentsInitialFetchByDriverEvent);
    on<PickupCartButtonNavigateEvent>(pickupCartButtonNavigateEvent);
    on<ShipmentPickupCartButtonClickedEvent>(
        shipmentPickupCartButtonClickedEvent);
    on<ShipmentRemovedfromListEvent>(shipmentRemovedfromListEvent);
    on<ClearPickupCartEvent>(clearPickupCartEvent);
  
  }

  FutureOr<void> shipmentsInitialFetchEvent(
      ShipmentsInitialFetchEvent event, Emitter<ShipmentState> emit) async {
    emit(ShipmentFetchingLoadingState());
// Fect Shipment Data
    List<ShipmentDataModel> shipments = await ShipmentsRepo.fetchShipment(event.pickId,event.fromPage);

    if (shipments != null) {
      shipmentCards = shipments;
    }
    
    emit(ShipmentFectchingSuccessfulState(shipments: shipmentCards));
  }

  FutureOr<void> pickupCartButtonNavigateEvent(
      PickupCartButtonNavigateEvent event, Emitter<ShipmentState> emit) {
    print('Pickup Cart Natigate Clicked');
    emit(ShipmentNavigateToPickupCartActionState());
  }

  FutureOr<void> shipmentPickupCartButtonClickedEvent(
      ShipmentPickupCartButtonClickedEvent event, Emitter<ShipmentState> emit) {
    print('Pickup adding to Cart');
    pickupCarts.add(event.pickupCart);
    emit(ShipmenPickupItemCartActionState());
  }

  FutureOr<void> shipmentRemovedfromListEvent(
      ShipmentRemovedfromListEvent event, Emitter<ShipmentState> emit) {
    print('Pickup adding to Cart');
    // pickupCarts.add(event.pickupCart);
    shipmentCards.remove(event.shipments);
    emit(ShipmentFectchingSuccessfulState(shipments: shipmentCards));
  }

  FutureOr<void> clearPickupCartEvent(ClearPickupCartEvent event, Emitter<ShipmentState> emit) {
     pickupCarts.clear();
     emit(ShipmenPickupItemCartActionState());
  }



  FutureOr<void> shipmentsInitialFetchByDriverEvent(ShipmentsInitialFetchByDriverEvent event, Emitter<ShipmentState> emit) async {
    emit(ShipmentFetchingLoadingState());
// Fect Shipment Data
    List<ShipmentDataModel> shipments = await ShipmentsRepo.fetchShipmentByDriver(event.pickId,event.fromPage);

    if (shipments != null) {
      shipmentCards = shipments;
    }
    
    emit(ShipmentFectchingSuccessfulState(shipments: shipmentCards));
  }
}
