import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ws_1/src/common/models/shipments_data_model.dart';
import 'package:flutter_ws_1/src/constants/global.dart';
import 'package:flutter_ws_1/src/features/direct/repos/direct_repo.dart';
import 'package:meta/meta.dart';

part 'direct_event.dart';
part 'direct_state.dart';

class DirectBloc extends Bloc<DirectEvent, DirectState> {
  DirectBloc() : super(DirectInitial()) {
    on<DirectInitialFetchEvent>(directInitialFetchEvent);
   
  }

  FutureOr<void> directInitialFetchEvent(DirectInitialFetchEvent event, Emitter<DirectState> emit) async {

  // Fect Load Data
  emit(DirectListFetchingLoadingState());
   String id = Global.storageService.getUserProfileKey();
 
  List<ShipmentsDataModel> shipmentLists = await DirectRepo.fetchShipment(id);
 emit(DirectListFetchingSuccessfulstate(shipments: shipmentLists));
 
  }
}
