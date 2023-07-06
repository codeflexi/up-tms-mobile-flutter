part of 'shipment_cart_bloc.dart';

@immutable
abstract class ShipmentCartState {}
abstract class ShipmentCartActionState extends ShipmentCartState {}

class ShipmentCartInitial extends ShipmentCartState {}

class ShipmentCartSuccessState extends  ShipmentCartState {
  final List<ShipmentDataModel> pickupCarts;

  ShipmentCartSuccessState({required this.pickupCarts});
}
