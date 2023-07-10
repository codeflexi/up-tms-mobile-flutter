import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ws_1/src/common/models/users_data_model.dart';
import 'package:flutter_ws_1/src/constants/global.dart';
import 'package:flutter_ws_1/src/features/auth/repos/user_repo.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
  on<ProfileInitialFetchEvent>(profileInitialFetchEvent);
  }

  FutureOr<void> profileInitialFetchEvent(ProfileInitialFetchEvent event, Emitter<ProfileState> emit)  async {
   emit(ProfileFetchingLoadingState());

   // Fetch Profile Data
   String id = Global.storageService.getUserProfileKey();

  List<String> user = await UserRepo.fetchUserProfile(id);
  emit(ProfileFetchingSuccessfulState(users: user));

  }
}
