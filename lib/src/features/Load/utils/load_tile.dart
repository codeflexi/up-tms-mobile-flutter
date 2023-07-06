import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/Load/bloc/load_bloc.dart';
import 'package:flutter_ws_1/src/features/Load/screens/load_home.dart';


import '../models/load_data_model.dart';

class LoadTile extends StatelessWidget {
  
  final LoadBloc loadBloc = LoadBloc();
  final LoadDataModel load;
  final Function()? onPressed;
  final IconData myIcon;
  final Color IconColor;

   LoadTile({
    super.key,
    required this.load,
    required this.onPressed,
    this.myIcon = Icons.add,
    this.IconColor = Colors.black,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green[100], borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListTile(
        onTap: () {
       
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.description),
            Text(load.load_number),
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(load.warehouse_name.toString(),
                style: Theme.of(context).textTheme.subtitle2),
            Text(load.warehouse_address.toString()),
            Text(load.warehouse_phone.toString()),
             Text(load.load_id.toString()),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(load.vehicle_type),
                Text(load.vehicle_plate_number),
                Text(load.vehicle_plate_province),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
         
  Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  LoadHomePage(),
                settings: RouteSettings(
                arguments: load,
                )),
          );


                  },
                  icon: const Icon(Icons.arrow_circle_right,color: Colors.black,size:40),
                ),
              ],
            )
          ],
        ),
        leading: Text(load.customer_name.toString(),
            style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
