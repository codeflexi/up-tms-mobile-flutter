import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/Load/bloc/load_bloc.dart';
import 'package:flutter_ws_1/src/features/Load/screens/load_home.dart';
import 'package:flutter_ws_1/src/features/delivery/screens/delivery_home.dart';
import 'package:flutter_ws_1/src/features/delivery/screens/un_delivery.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';

class DeliveryTile extends StatelessWidget {
  final LoadBloc loadBloc = LoadBloc();
  final ShipmentDataModel shipment;
  final Function()? onPressed;
  final IconData myIcon;
  final Color IconColor;

  DeliveryTile({
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
          color: Colors.blue.shade100, borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListTile(
        onTap: () {},
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.inventory,
              color: Colors.green,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Row(
              children: [
                Text(shipment.waybill_number ),
                SizedBox(
                  width: 10,
                ),
                Text('[' + shipment.shop_name+ ']'),
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
                    color: Colors.blue.shade400,
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
                 
                    const Icon(
                      Icons.person_pin_circle,
                      color: Colors.red,
                      size: 30,
                    ),
                    Text(shipment.customer_address.toString(),
                        style: Theme.of(context).textTheme.headline6),
                    Text(shipment.shipment_number.toString() +
                        ' : ' +
                        shipment.shipment_content.toString()),
                    Text('ลูกค้า : ' + shipment.customer_name.toString()),
                    Text('โทร : ' + shipment.customer_phone.toString()),
                    const SizedBox(
                      height: 5,
                    ),
                    shipment.shipment_iscod == 'Y'
                ? Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5)),
                    margin: const EdgeInsets.only(bottom: 2, top: 2),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.currency_bitcoin,
                          color: Colors.red,
                          size: 20,
                        ),
                        Text(
                            'เก็บเงินปลายทาง จำนวน : ' +
                                shipment.shipment_cod +
                                ' บาท',
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  )
                : SizedBox(),
                  ],
                )
              ]),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: OutlinedButton.icon(
                          // <-- ElevatedButton
                          onPressed: () {
                               Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UnDeliveryPage(),
                          settings: RouteSettings(
                            arguments: shipment,
                          )),
                    );
                          },

                          icon: Icon(
                            Icons.person_off,
                            size: 24.0,
                          ),
                          label: Text('U N  - D E L'),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeliveryHomePage(),
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
