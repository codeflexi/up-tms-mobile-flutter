import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/configs/config.dart';
import 'package:flutter_ws_1/src/constants/global.dart';
import 'package:flutter_ws_1/src/features/Load/models/load_data_model.dart';
import 'package:flutter_ws_1/src/features/pickup/models/pickup.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoadsRepo {
  static Future<List<LoadDataModel>> fetchLoad(String id) async {
    var client = http.Client();
    // List listResponse = [];
    List<LoadDataModel> loads = [];
    //  String id = Global.storageService.getUserProfileKey();
      String uri = '/api/v1/shipment-dispatchs/driver/$id';
    try {
      var response = await client.get(Uri.parse(backendUrl + uri));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // event --> block --> state
        var jsonResponse = jsonDecode(response.body);

        List result = jsonResponse['data'];

        for (int i = 0; i < result.length; i++) {
          LoadDataModel load =
              LoadDataModel.fromJson(result[i] as Map<String, dynamic>);
          loads.add(load);
        }

        // listResponse = jsonResponse['data'];

        //print(listResponse);

        //return listResponse;
      }
    } catch (e) {
      // pickups = [];
      return loads;

      //log(e.toString());
    }
    return loads;
  }

  static Future<bool> updateLoading(
      String id, File image, Uint8List signature, List shipment) async {
    late bool returnResult = false;

    var client = http.Client();
    // List listResponse = [];
    //const String pick_id = id;
    String uri = '/api/v1/shipment-dispatchs/loaded/$id';

    
    var reqBody = {
      "photo": image != null
          ? 'data:image/png;base64,' + base64Encode(image.readAsBytesSync())
          : '',
      "signature": signature != null
          ? 'data:image/png;base64,' + base64Encode(signature)
          : '',
      // "signature": baseimg,
      "shipment_ids": shipment,
      "status": "DELIVERED",
    };

    try {
      String token = Global.storageService.getUserToken();
         
      var response = await http.put(Uri.parse(backendUrl + uri),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(reqBody));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // event --> block --> state

        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse['success']) {
          returnResult = true;
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> PostsPage(token:myToken)));
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> PickupList()));

        } else {
          returnResult = false;
        }

        // listResponse = jsonResponse['data'];

        //print(listResponse);

        //return listResponse;
      }
    } catch (e) {
      print(e);
      // pickups = [];
      return false;

      //log(e.toString());
    }
    return returnResult;
  }
}


// const data = {
//       photo: imgSorce.value,
//       signature: signImg.value,
//       shipment_ids: unique,
//     };

//      async handleCreatePicking(id, data) {
//       try {
//         const apiURL = `/api/v1/shipment-picks/picked/${id}`;
//         return await server.put(apiURL, data)
//       } catch (error) {
//         if (error) throw error
//       }
//     },