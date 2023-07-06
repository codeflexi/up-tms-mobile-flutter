part of 'shipment_bloc.dart';

@immutable
abstract class ShipmentEvent {}

class ShipmentsInitialFetchEvent extends ShipmentEvent {
  final String pickId;
  final String fromPage;
  ShipmentsInitialFetchEvent({required this.pickId,required this.fromPage});

}


// Add to state ผ่าน event
class ShipmentPickupCartButtonClickedEvent extends ShipmentEvent{
  final ShipmentDataModel pickupCart;
  ShipmentPickupCartButtonClickedEvent({required this.pickupCart});
}

class ShipmentRemovedfromListEvent extends ShipmentEvent{
  final ShipmentDataModel shipments;
  ShipmentRemovedfromListEvent({required this.shipments});
}

class PickupCartButtonNavigateEvent extends ShipmentEvent{}

// Add to state ผ่าน event
class ClearPickupCartEvent extends ShipmentEvent{
}


