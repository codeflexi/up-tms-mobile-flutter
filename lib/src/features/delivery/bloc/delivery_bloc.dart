import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ws_1/src/constants/global.dart';
import 'package:flutter_ws_1/src/features/delivery/repos/delivery_repo.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:flutter_ws_1/src/features/pickup/repos/shipments_repo.dart';
import 'package:meta/meta.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  DeliveryBloc() : super(DeliveryInitial()) {
  on<DeliveryInitialFetchEvent>(deliveryInitialFetchEvent);
  }

  FutureOr<void> deliveryInitialFetchEvent(DeliveryInitialFetchEvent event, Emitter<DeliveryState> emit) async {
  // Fect Load Data
  emit(DeliveryListFetchingLoadingState());
   String id = Global.storageService.getUserProfileKey();
 
    List<ShipmentDataModel> shipmentLists = await DeliveryRepo.fetchShipment(id);
 emit(DeliveryListFetchingSuccessfulState(shipments: shipmentLists));
 
  }
}
