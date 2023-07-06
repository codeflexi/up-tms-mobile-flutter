part of 'pickup_home_bloc.dart';

@immutable
abstract class PickupHomeState {}
abstract class PickupHomeActionState extends PickupHomeState{}

class PickupHomeInitial extends PickupHomeState {}

class PickupFetchingLoadingState extends PickupHomeState{}
class PickupFetchingErrorState extends PickupHomeState {}

// เก็บข้อมูลที่ load เรียนร้อยแล้วใน state  ตัวแปล shipments
class PickupFectchingSuccessfulState extends PickupHomeState {
  final List<PickupDataModel> pickups;
  PickupFectchingSuccessfulState({ required this.pickups,});
}



