part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessstate extends HomeState{
  final List<ProductDataModel> products;
  HomeLoadedSuccessstate({
    required this.products});
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

// Action = do action and Simple = build ui State

