part of 'load_bloc.dart';

@immutable
abstract class LoadState {}
abstract class LoadActionState extends LoadState{}


class LoadInitial extends LoadState {}
 
class LoadListInitialFetchState extends LoadState{}

class LoadListFetchingLoadingState extends LoadState {}
class LoadListFetchingErrorState extends LoadState {}

class LoadListFetchingSuccessfulState extends LoadState {

 final List<LoadDataModel> loads;
  LoadListFetchingSuccessfulState({ required this.loads,});
}


