import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ws_1/src/features/Load/models/load_data_model.dart';
import 'package:flutter_ws_1/src/features/Load/repos/loads_repo.dart';
import 'package:meta/meta.dart';

import '../../../constants/global.dart';

part 'load_event.dart';
part 'load_state.dart';

class LoadBloc extends Bloc<LoadEvent, LoadState> {
  LoadBloc() : super(LoadInitial()) {
 on<LoadInitialFetchEvent>(loadInitialFetchEvent);
  }



  FutureOr<void> loadInitialFetchEvent(LoadInitialFetchEvent event, Emitter<LoadState> emit) async {
  emit(LoadListFetchingLoadingState());
 
  // Fect Load Data
   String id = Global.storageService.getUserProfileKey();
  
    List<LoadDataModel> loadlists = await LoadsRepo.fetchLoad(id);
 emit(LoadListFetchingSuccessfulState(loads: loadlists));
  }
}
