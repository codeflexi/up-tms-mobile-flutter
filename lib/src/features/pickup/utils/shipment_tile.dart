import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';

class ShipmentTile extends StatelessWidget {
  final ShipmentDataModel shipment;
  final Function()? onPressed;
  final IconData myIcon;
  final Color IconColor;
  const ShipmentTile({
    super.key,
    required this.shipment,
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
        title: Text(shipment.waybill_number),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(shipment.shipment_number,
                style: Theme.of(context).textTheme.subtitle2),
            Text(shipment.shipment_content),
          ],
        ),
        leading: Text(shipment.shop_name,
            style: Theme.of(context).textTheme.headline6),
        trailing: IconButton(
          icon: Icon(myIcon,color: IconColor,),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
