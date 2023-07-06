part of 'shipment_cart_bloc.dart';

@immutable
abstract class ShipmentCartEvent {}

class ShipmentCartInitialEvent extends ShipmentCartEvent {}

class ShipmentCartRemoveFromCartEvent extends ShipmentCartEvent{
  final ShipmentDataModel shipmentDataModel;

  ShipmentCartRemoveFromCartEvent({required this.shipmentDataModel});
}
