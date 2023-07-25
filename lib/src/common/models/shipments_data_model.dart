// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:intl/intl.dart';


//final formatter = DateFormat.yMd();
final formatter = DateFormat('dd/MM/yyyy HH:MM');


class ShipmentsDataModel {
  final String shipment_id;
  final String waybill_number;
  final String shipment_number;
  final String shop_name;
   final String customer_name;
   final String customer_address;
   final String? customer_city;
   final String? customer_state;
    final String? customer_zipcode;
   final String customer_phone;
    final String warehouse_name;
   final String warehouse_address;
   final String warehouse_phone;
   final String shipment_content;
   final String shipment_cod;
   final String shipment_iscod;
   final String? picking_date;
  // final Map<String,Object> address;
  // final Map<String,Object> cod;

  ShipmentsDataModel({
    required this.shipment_id,
    required this.waybill_number,
    required this.shipment_number,
    required this.shop_name,
    required this.customer_name,
    required this.customer_address,
    this.customer_city,
    this.customer_state,
    this.customer_zipcode,
    required this.customer_phone,
    required this.warehouse_name,
    required this.warehouse_address,
    required this.warehouse_phone,
    required this.shipment_content,
    required this.shipment_cod,
    required this.shipment_iscod,
    this.picking_date
  });

  factory ShipmentsDataModel.fromJson(Map<String, dynamic> json) {
    //  if (json == null) {
    //   return;
    // }

   String formattedDate(String date) {
      DateTime dt = DateTime.parse(date);
      return formatter.format(dt);
    }


       return ShipmentsDataModel(
        shipment_id: json['_id'] ?? '',
        waybill_number: json['waybill_number'] ?? '',
        shipment_number: json['shipment_number'] ?? '',
        shop_name: json['company']['name'] ?? '',
        warehouse_name: json['warehouse']['name']?? '',
        warehouse_address: json['warehouse']['address_line1'] ?? '' +
        json['warehouse']['address_line2'] ?? '',
        warehouse_phone: json['warehouse']['phone'] ?? '',
        customer_name: json['shipping_full_name'] ?? '',
        customer_address: json['shipping_address_line1'] ?? '' +
        json['shipping_address_line2'] ?? '',
        customer_city: json['city'] ?? '',
        customer_state: json['state'] ?? '',
        customer_zipcode: json['zipcode'] ?? '',
        customer_phone: json['phone'] ?? '',
        shipment_content: json['content_items'].toString(),
        shipment_iscod: json['cargo_info']['iscod']?? 'N',
        shipment_cod: json['cargo_info']['cod_amount'].toString()?? '0',
       picking_date: formattedDate(json['picking_date']) ?? '',
        );
  }
}

// List data = jsonDecode(response.body);
// data.forEach((element)) {
//   Map obj = element;
//   String name = obj['name'];
//  Map address = obj['address'];
//  String street = address['street']
//  String geo = address['geo'];
//  Sgring lat = geo['lat']
// }