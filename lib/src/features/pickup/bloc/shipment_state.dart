part of 'shipment_bloc.dart';

@immutable
abstract class ShipmentState {}

abstract class ShipmentActionState extends ShipmentState {}

class ShipmentInitial extends ShipmentState {}


class ShipmentFetchingLoadingState extends ShipmentState {}

class ShipmentFetchingErrorState extends ShipmentState {}

// เก็บข้อมูลที่ load เรียนร้อยแล้วใน state  ตัวแปล shipments
class ShipmentFectchingSuccessfulState extends ShipmentState {
  final List<ShipmentDataModel> shipments;
  ShipmentFectchingSuccessfulState({ required this.shipments,});
}

class ShipmentNavigateToPickupCartActionState extends ShipmentActionState{}

class ShipmenPickupItemCartActionState extends ShipmentActionState{}

