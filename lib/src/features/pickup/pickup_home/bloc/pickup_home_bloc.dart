import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ws_1/src/constants/global.dart';
import 'package:flutter_ws_1/src/features/pickup/models/pickup.dart';
import 'package:flutter_ws_1/src/features/pickup/repos/pickups_repo.dart';
import 'package:meta/meta.dart';

part 'pickup_home_event.dart';
part 'pickup_home_state.dart';

class PickupHomeBloc extends Bloc<PickupHomeEvent, PickupHomeState> {
  PickupHomeBloc() : super(PickupHomeInitial()) {
    on<PickupInitialFetchEvent>(pickupInitialFetchEvent);
   
  }

  FutureOr<void> pickupInitialFetchEvent(PickupInitialFetchEvent event, Emitter<PickupHomeState> emit) async {
   emit(PickupFetchingLoadingState());

// Fetch Shipment Data
  String id = Global.storageService.getUserProfileKey();
  
  List<PickupDataModel> pickuplists = await PickupsRepo.fetchPickup(id);
  emit(PickupFectchingSuccessfulState(pickups: pickuplists));

  }


}
