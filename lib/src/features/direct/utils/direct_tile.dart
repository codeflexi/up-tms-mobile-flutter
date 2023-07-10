import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/common/models/shipments_data_model.dart';
import 'package:flutter_ws_1/src/features/Load/bloc/load_bloc.dart';
import 'package:flutter_ws_1/src/features/delivery/screens/delivery_home.dart';
import 'package:flutter_ws_1/src/features/delivery/screens/un_delivery.dart';
import 'package:flutter_ws_1/src/features/direct/screens/direct_home.dart';

class DirectTile extends StatelessWidget {
  final LoadBloc loadBloc = LoadBloc();
  final ShipmentsDataModel shipment;
  final Function()? onPressed;
  final IconData myIcon;
  final Color IconColor;

  DirectTile({
    super.key,
    required this.shipment,
    required this.onPressed,
    this.myIcon = Icons.add,
    this.IconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    // Main Container
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
          color: Colors.brown.shade100,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListTile(
        onTap: () {},
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.local_shipping,
              color: Colors.brown,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Row(
              children: [
                Text(shipment.waybill_number),
                SizedBox(
                  width: 10,
                ),
                Text('[' + shipment.shop_name + ']'),
              ],
            ),
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              // Line seperate container
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.brown.shade900,
                    borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.only(bottom: 2, top: 2),
                padding:
                    const EdgeInsets.symmetric(vertical: 1.5, horizontal: 1.5),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.only(bottom: 2, top: 2),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
Center(
  child:   Text('กำหนดรับ' + ':' + shipment.picking_date.toString(),
                          style: Theme.of(context).textTheme.headline6),
),
                    Row(
                      children: [
                        const Icon(
                          Icons.warehouse,
                          color: Colors.green,
                          size: 30,
                        ),
                        SizedBox(width: 10,),
                           Text(shipment.warehouse_name.toString(),
                        style: Theme.of(context).textTheme.headline4),
                      ],
                    ),
                 

                    Text(shipment.warehouse_address.toString(),
                        style: Theme.of(context).textTheme.headline6),
                    Text('โทร : ' + shipment.warehouse_phone.toString()),
                    Text(shipment.shipment_number.toString() +
                        ' : ' +
                        shipment.shipment_content.toString()),
                    const SizedBox(
                      height: 5,
                    ),
                    shipment.customer_name != 'Y'
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(5)),
                            margin: const EdgeInsets.only(bottom: 2, top: 2),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    Text('  '),
                                    Text(shipment.customer_name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                  ],
                                ),
                                Wrap(
                                 
                                  children: [
                                  
                                    Text(shipment.customer_address,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                              Text('โทร:' + shipment.customer_phone),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ],
                )
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DirectHomePage(),
                          settings: RouteSettings(
                            arguments: shipment,
                          )),
                    );
                  },
                  icon: const Icon(Icons.arrow_circle_right,
                      color: Colors.black, size: 40),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
