import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ws_1/src/common/models/users_data_model.dart';
import 'package:flutter_ws_1/src/constants/global.dart';
import 'package:flutter_ws_1/src/features/auth/home/home_landing_page.dart';
import 'package:flutter_ws_1/src/features/auth/profile/bloc/profile_bloc.dart';
import 'package:flutter_ws_1/src/features/auth/repos/user_repo.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final ProfileBloc profileBloc = ProfileBloc();

  @override
  void initState() {
    // TODO: implement initState
    profileBloc.add(ProfileInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('U S E R - P R O F I L E'),
        backgroundColor: Colors.grey[900],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeLandingPage();
              }));
            }),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
         bloc: profileBloc,
        listenWhen: ((previous, current) => current is ProfileActionState),
      buildWhen: ((previouse, current) => current is! ProfileActionState),
      listener: (context, state) {},
        builder: (context, state) {

switch (state.runtimeType) {
          case ProfileFetchingLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ProfileFetchingSuccessfulState:
            final successState = state as ProfileFetchingSuccessfulState;

          return ListView(
            children: [
              // profile pic
              const SizedBox(
                height: 50,
              ),

              Icon(
                Icons.person,
                size: 72,
              ),

   const SizedBox(
                height: 10,
              ),

              // user email
              Text(successState.users[1],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
              ),

              // user details
  
              // user email
              Text(successState.users[2] + ' ' + successState.users[3],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
              ),
   // user email
              Text(successState.users[4],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
              ),
              // username

              // bio

              // user posts
            ],
          );

   default:
            return const SizedBox();
        }

        },
      ),
    );
  }
}
