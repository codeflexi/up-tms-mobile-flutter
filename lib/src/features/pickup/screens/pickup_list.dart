import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ws_1/src/features/auth/home/home_landing_page.dart';

import 'package:flutter_ws_1/src/features/pickup/models/pickup.dart';
import 'package:flutter_ws_1/src/features/pickup/pickup_home/bloc/pickup_home_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/pickup_home.dart';
import 'package:flutter_ws_1/src/features/pickup/utils/pickup_tile.dart';


class PickupList extends StatefulWidget {
  const PickupList({super.key});

  @override
  State<PickupList> createState() => _PickupListState();
}

class _PickupListState extends State<PickupList> {
  final PickupHomeBloc pickupHomeBloc = PickupHomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    pickupHomeBloc.add(PickupInitialFetchEvent());
    super.initState();
  }

  void goToDetail(PickupDataModel pickup) {
    // Navigator.of(context)
    // .push(MaterialPageRoute(
    //   builder:
    //   (context) => PickupHomePage(pickId: pickup.pick_id)
    //   ),
    //   );

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PickupHomePage(),
          settings: RouteSettings(
            arguments: pickup,
          )),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<PickupHomeBloc, PickupHomeState>(
      bloc: pickupHomeBloc,
      listenWhen: ((previous, current) => current is PickupHomeActionState),
      buildWhen: ((previouse, current) => current is! PickupHomeActionState),
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case PickupFetchingLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PickupFectchingSuccessfulState:
            final successState = state as PickupFectchingSuccessfulState;
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                title: const Text("N O R M A L - P I C K U P"),
                  backgroundColor: Colors.grey[900],
              leading:IconButton(
            icon: Icon(Icons.home),
              onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeLandingPage();
          }));

              }),
            
            ),
              
         
              body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      // heading message successState.shipments.length
                      Text(
                        "เลือก เพื่อรับของจาก " +
                            successState.pickups.length.toString() +
                            " รายการ",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),

                      //list of shipments
                      Expanded(
                          child: ListView.builder(
                        itemCount: successState.pickups.length,
                        itemBuilder: (context, index) {
                          PickupDataModel eachPickup =
                              successState.pickups[index];

                          // return the tile for this shipments
                          return PickupTile(
                            pickup: eachPickup,
                            onPressed: () => goToDetail(eachPickup),
                          );
                        },
                      ))
                    ],
                  )),
            );
          default:
            return const SizedBox();
        }
      },
    ));
  }
}
