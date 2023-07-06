part of 'delivery_bloc.dart';

@immutable
abstract class DeliveryState {}
abstract class DeliveryActionState extends DeliveryState {}

class DeliveryInitial extends DeliveryState {}

class DeliveryListInitialFectState extends DeliveryState {}
class DeliveryListFetchingLoadingState extends DeliveryState {}
class DeliveryListFetchingErrorState extends DeliveryState {}

class DeliveryListFetchingSuccessfulState extends DeliveryState {

 final List<ShipmentDataModel> shipments;
  DeliveryListFetchingSuccessfulState({ required this.shipments,});

}

