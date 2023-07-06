part of 'direct_bloc.dart';

@immutable
abstract class DirectState {}
abstract class DirectActionState extends DirectState {}

class DirectInitial extends DirectState {}

class DirectListInitialFetchState extends DirectState{}
class DirectListFetchingLoadingState extends DirectState{}

class DirectListFetchingErrorState extends DirectState{}

class DirectListFetchingSuccessfulstate extends DirectState {
  final List<ShipmentsDataModel> shipments;
  DirectListFetchingSuccessfulstate({required this.shipments});
}

