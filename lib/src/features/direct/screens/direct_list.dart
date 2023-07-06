import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ws_1/src/common/models/shipments_data_model.dart';
import 'package:flutter_ws_1/src/features/auth/home/home_landing_page.dart';
import 'package:flutter_ws_1/src/features/direct/bloc/direct_bloc.dart';
import 'package:flutter_ws_1/src/features/direct/utils/direct_tile.dart';


class DirectListPage extends StatefulWidget {
  const DirectListPage({super.key});

  @override
  State<DirectListPage> createState() => _DirectListPageState();
}

class _DirectListPageState extends State<DirectListPage> {
  final DirectBloc directBloc = DirectBloc();

  @override
  void initState() {
    // TODO: implement initState
    directBloc.add(DirectInitialFetchEvent());
    super.initState();
  }

  void goToDetail(ShipmentsDataModel shipment) {
  
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<DirectBloc, DirectState>(
      bloc: directBloc,
      listenWhen: ((previous, current) => current is DirectActionState),
      buildWhen: ((previouse, current) => current is! DirectActionState),
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case DirectListFetchingLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case DirectListFetchingSuccessfulstate:
            final successState = state as DirectListFetchingSuccessfulstate;
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                title: const Text("D I R E C T - P I C K U P"),
              leading:IconButton(
            icon: Icon(Icons.home),
              onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeLandingPage();
          }));

              }),
            
            ),
         
              body:  Scrollbar(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:  Column(
                      children: [
                        // heading message successState.shipments.length
                        Text(
                          "เลือก เพื่อรับของจาก " +
                              successState.shipments.length.toString() +
                              " รายการ",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
              
                        //list of shipments
                        Expanded(
                            child: ListView.builder(
                          itemCount: successState.shipments.length,
                          itemBuilder: (context, index) {
                            ShipmentsDataModel eachLoad =
                                successState.shipments[index];
              
                            // return the tile for this shipments
                            return DirectTile(
                              shipment: eachLoad,
                              onPressed: () => goToDetail(eachLoad),
                            );
                          },
                        ))
                      ],
                    )),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    ));
  }
}
