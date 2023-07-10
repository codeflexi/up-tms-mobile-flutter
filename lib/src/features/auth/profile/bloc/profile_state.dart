part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}
abstract class ProfileActionState extends ProfileState{}
class ProfileInitial extends ProfileState {}

class ProfileFetchingLoadingState extends ProfileState{}

class ProfileFetchingErrorState extends ProfileState{}
class ProfileFetchingSuccessfulState extends ProfileState{
  final List<String> users;
  ProfileFetchingSuccessfulState({required this.users});
}
