
class PickupDataModel {
  final String pick_id;
  final String pick_number;
  final String pick_momo;
  final String picking_date;
  final String driver_name;
  final String vehicle_plate_number;
  final String vehicle_plate_province;
  final String vehicle_type;
  final String customer_name;
  final String customer_address;
  final String customer_phone;
  final String customer_route;
  //final String shipment_count;
 
  final String warehouse_name;
  final String warehouse_address;
  final String warehouse_phone;
  final String warehouse_route;



  // final String shipment_cod;
  // final Map<String,Object> address;
  // final Map<String,Object> cod;

  PickupDataModel({
    required this.pick_id,
    required this.pick_number,
    required this.pick_momo,
    required this.picking_date,
    required this.driver_name,
    required this.vehicle_plate_number,
    required this.vehicle_plate_province,
    required this.vehicle_type,
    required this.customer_name,
    required this.customer_address,
    required this.customer_phone,
    required this.customer_route,
   //required this.shipment_count,
    required this.warehouse_name,
    required this.warehouse_address,
    required this.warehouse_phone,
    required this.warehouse_route,
   
   
  });

// String _convertDateTime (json) {
//     var date = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(json, true);
// var dateLocal  = date.toLocal()
//   }

  factory PickupDataModel.fromJson(Map<String, dynamic> json) {
    //  if (json == null) {
    //   return;
    // }
    return PickupDataModel(
      pick_id: json['_id'],
      pick_number: json['pick_number'] ?? '',
      pick_momo: json['memo'] ?? '' ,
    picking_date: json['planned_date'] ?? '',
      driver_name: json['driver']['name'] ?? '',
      vehicle_plate_number:json['vehicle']['plate_number'] ?? '',
       vehicle_plate_province: json['vehicle']['plate_province']  ?? '',
      vehicle_type: json['vehicle']['type'] ?? '',
      //shipment_count : json['shipment_ids'].length.toString(),
      customer_name:json['company']['name'] ?? '',
      customer_address: json['company']['address_line1'] ?? '',
      customer_phone: json['company']['phone'] ?? '',
      customer_route:
          json['company']['city'] ?? ''  + ',' + json['company']??['state'] ?? '',
      warehouse_name:
          json['warehouse']['name'] ?? '',
        warehouse_address:
          json['warehouse']['address_line1'] ?? '',
        warehouse_phone:
          json['warehouse']['phone'] ?? '',
        warehouse_route:
         json['warehouse']['city'] ?? ''  + ',' + json['warehouse']['state'] ?? '',
    );
  }
}



// class PickupDataModel {
//   final String pick_id;
//   final String pick_number;
//   final String pick_momo;
//   final String picking_date;
//   final String driver_name;
//   // final String vehicle_plate_number;
//   // final String vehicle_plate_province;
//   // final String vehicle_type;
//   // final String customer_name;
//   // final String customer_address;
//   // final String customer_phone;
//   // final String customer_route;
 
//   // final String warehouse_name;
//   // final String warehouse_address;
//   // final String warehouse_phone;
//   // final String warehouse_route;


//   // final String shipment_cod;
//   // final Map<String,Object> address;
//   // final Map<String,Object> cod;

//   PickupDataModel({
//     required this.pick_id,
//     required this.pick_number,
//     required this.pick_momo,
//     required this.picking_date,
//     required this.driver_name,
//     // required this.vehicle_plate_number,
//     // required this.vehicle_plate_province,
//     // required this.vehicle_type,
//     // required this.customer_name,
//     // required this.customer_address,
//     // required this.customer_phone,
//     // required this.customer_route,
   
//     // required this.warehouse_name,
//     // required this.warehouse_address,
//     // required this.warehouse_phone,
//     // required this.warehouse_route,
   
//   });

//   factory PickupDataModel.fromJson(Map<String, dynamic> json) {
//     return PickupDataModel(
//       pick_id: json['_id'],
//       pick_number: json['pick_number'].toString(),
//       pick_momo: json['memo'] ==null? '':json['memo'].toString(),
//       picking_date: json['planned_date'] == null
//           ? ''
//           : json['planned_date'].toString(),
//       driver_name: json['driver']['name'] == null
//           ? ''
//       //     : json['driver']['name'].toString(),
//       // vehicle_plate_number:
//       //     json['vehicle']['plate_number'] == null ?'' : json['vehicle']['plate_number'].toString() ,
//       //  vehicle_plate_province:
//       //     json['vehicle']['plate_province'] == null ?'' : json['vehicle']['plate_province'].toString() ,
//       // vehicle_type:
//       //     json['vehicle']['type'] == null ?'' : json['vehicle']['type'].toString(),
//       // customer_name:
//       //     json['company']['name'] == null ?'' : json['company']['name'].toString(),
//       // customer_address:
//       //     json['company']['address_line1'] == null?'' : json['company']['address_line1'].toString(),
//       // customer_phone:
//       //     json['company']['phone'] == null ?'' : json['company']['phone'].toString(),
//       // customer_route:
//       //     json['company']['city'] == null ?'' : json['company']['city'] + ',' + json['company']['state'].toString(),
//       // warehouse_name:
//       //     json['warehouse']['name'] == null ?'' : json['warehouse']['name'].toString(),
//       //   warehouse_address:
//       //     json['warehouse']['address_line1'] == null ?'' : json['warehouse']['address_line1'].toString(),
//       //   warehouse_phone:
//       //     json['warehouse']['phone'] == null ?'' : json['warehouse']['phone'].toString(),
//       //   warehouse_route:
//       //     json['warehouse']['city'] == null ?'' : json['warehouse']['city'] + ',' + json['warehouse']['state'].toString(),
      
//     );
//   }
// }
