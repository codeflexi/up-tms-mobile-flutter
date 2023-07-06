import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/pickup/bloc/shipment_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/models/pickup.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:flutter_ws_1/src/features/pickup/pickup_home/bloc/pickup_home_bloc.dart';
import 'package:flutter_ws_1/src/features/pickup/screens/pickup_home.dart';
import 'package:flutter_ws_1/tab.dart';

class PickupTile extends StatelessWidget {
  
  final ShipmentBloc shipmentBloc = ShipmentBloc();
  final PickupDataModel pickup;
  final Function()? onPressed;
  final IconData myIcon;
  final Color IconColor;

   PickupTile({
    super.key,
    required this.pickup,
    required this.onPressed,
    this.myIcon = Icons.add,
    this.IconColor = Colors.black,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListTile(
        onTap: () {
       
        },
        title: Text(pickup.pick_number),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pickup.warehouse_name.toString(),
                style: Theme.of(context).textTheme.subtitle2),
            Text(pickup.warehouse_address.toString()),
            Text(pickup.warehouse_phone.toString()),
             Text(pickup.pick_id.toString()),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(pickup.vehicle_type),
                Text(pickup.vehicle_plate_number),
                Text(pickup.vehicle_plate_province),
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
                builder: (context) =>  PickupHomePage(),
                settings: RouteSettings(
                arguments: pickup,
                )),
          );


                  },
                  icon: Icon(Icons.arrow_circle_right,color: Colors.black,size:40),
                ),
              ],
            )
          ],
        ),
        leading: Text(pickup.customer_name.toString(),
            style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
