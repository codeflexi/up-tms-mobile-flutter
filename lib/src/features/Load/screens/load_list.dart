import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ws_1/src/features/Load/bloc/load_bloc.dart';
import 'package:flutter_ws_1/src/features/Load/screens/load_home.dart';
import 'package:flutter_ws_1/src/features/Load/utils/load_tile.dart';
import 'package:flutter_ws_1/src/features/auth/home/home_landing_page.dart';

import 'package:flutter_ws_1/src/features/pickup/screens/pickup_home.dart';


import '../models/load_data_model.dart';


class LoadListPage extends StatefulWidget {
  const LoadListPage({super.key});

  @override
  State<LoadListPage> createState() => _LoadListStateState();
}

class _LoadListStateState extends State<LoadListPage> {
  final LoadBloc loadBloc = LoadBloc();

  @override
  void initState() {
    // TODO: implement initState
    loadBloc.add(LoadInitialFetchEvent());
    super.initState();
  }

  void goToDetail(LoadDataModel load) {
    // Navigator.of(context)
    // .push(MaterialPageRoute(
    //   builder:
    //   (context) => PickupHomePage(pickId: pickup.pick_id)
    //   ),
    //   );

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoadHomePage(),
          settings: RouteSettings(
            arguments: load,
          )),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<LoadBloc, LoadState>(
      bloc: loadBloc,
      listenWhen: ((previous, current) => current is LoadActionState),
      buildWhen: ((previouse, current) => current is! LoadActionState),
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadListFetchingLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case LoadListFetchingSuccessfulState:
            final successState = state as LoadListFetchingSuccessfulState;
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                title: const Text("L O A D"),
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
                            successState.loads.length.toString() +
                            " รายการ",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),

                      //list of shipments
                      Expanded(
                          child: ListView.builder(
                        itemCount: successState.loads.length,
                        itemBuilder: (context, index) {
                          LoadDataModel eachLoad =
                              successState.loads[index];

                          // return the tile for this shipments
                          return LoadTile(
                            load: eachLoad,
                            onPressed: () => goToDetail(eachLoad),
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
