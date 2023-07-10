import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/configs/config.dart';
import 'package:flutter_ws_1/src/constants/global.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:http/http.dart' as http;

class ShipmentsRepo {
  static Future<List<ShipmentDataModel>> fetchShipment(String id , String fromPage) async {
    var client = http.Client();
    // List listResponse = [];
    List<ShipmentDataModel> shipments = [];
    String uri = '';
    try {
      if (fromPage == 'pick') {
      uri = '/api/v1/shipment-picks/$id';
      } else {
       uri = '/api/v1/shipment-dispatchs/$id';
      }

      // /api/v1/shipments?status=PICKING UP&driver=637f31761deb473649f7027b
      // /api/v1/shipments?status=DISPATCHING&driver=637f31761deb473649f7027b

      var response =
          //await client.get(Uri.parse(backendUrl + '/api/v1/shipments'));
          await client.get(Uri.parse(backendUrl + uri));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // event --> block --> state
        var jsonResponse = jsonDecode(response.body);

        List result = jsonResponse['data']['shipment_ids'];

        for (int i = 0; i < result.length; i++) {
          ShipmentDataModel shipment =
              ShipmentDataModel.fromJson(result[i] as Map<String, dynamic>);
          shipments.add(shipment);
        }
      } else {
        shipments = [];
      }
    } catch (e) {
      shipments = [];
      //log(e.toString());
    }
    return shipments;
  }

static Future<List<ShipmentDataModel>> fetchShipmentByDriver(String id , String fromPage) async {
    var client = http.Client();
    // List listResponse = [];
    List<ShipmentDataModel> shipments = [];
    String uri = '';
     String user_id = Global.storageService.getUserProfileKey();
    try {
      if (fromPage == 'pick') {
      uri = '/api/v1/shipments?status=PICKING UP&driver=$user_id';
      } else {
       uri = '/api/v1/shipments?status=DISPATCHING&driver=$user_id';
      }

      // /api/v1/shipments?status=PICKING UP&driver=637f31761deb473649f7027b
      // /api/v1/shipments?status=DISPATCHING&driver=637f31761deb473649f7027b

      var response =
          //await client.get(Uri.parse(backendUrl + '/api/v1/shipments'));
          await client.get(Uri.parse(backendUrl + uri));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // event --> block --> state
        var jsonResponse = jsonDecode(response.body);

        List result = jsonResponse['data'];

        for (int i = 0; i < result.length; i++) {
          ShipmentDataModel shipment =
              ShipmentDataModel.fromJson(result[i] as Map<String, dynamic>);
          shipments.add(shipment);
        }
      } else {
        shipments = [];
      }
    } catch (e) {
      shipments = [];
      //log(e.toString());
    }
    return shipments;
  }

}
