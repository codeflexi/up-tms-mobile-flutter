import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';


import 'package:flutter_ws_1/src/configs/config.dart';
import 'package:flutter_ws_1/src/constants/global.dart';
import 'package:flutter_ws_1/src/features/pickup/models/pickup.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';
import 'package:http/http.dart' as http;


class PickupsRepo {
  static Future<List<PickupDataModel>> fetchPickup(String id) async {
    var client = http.Client();
    // List listResponse = [];
    List<PickupDataModel> pickups = [];
    print('User ID');
    print(id);
    //  String id = Global.storageService.getUserProfileKey();
      String uri = '/api/v1/shipment-picks/driver/$id';
    try {
      var response = await client.get(Uri.parse(backendUrl +
          uri));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // event --> block --> state
        var jsonResponse = jsonDecode(response.body);

        List result = jsonResponse['data'];

        for (int i = 0; i < result.length; i++) {
          PickupDataModel pickup =
              PickupDataModel.fromJson(result[i] as Map<String, dynamic>);
          pickups.add(pickup);
        }

        // listResponse = jsonResponse['data'];

        //print(listResponse);

        //return listResponse;
      }
    } catch (e) {
      // pickups = [];
      return pickups;

      //log(e.toString());
    }
    return pickups;
  }

  static Future<bool> updatePickup(
      String id, File image, Uint8List signature, List shipment) async {
    late bool returnResult = false;

    var client = http.Client();
    // List listResponse = [];
    //const String pick_id = id;
    String uri = '/api/v1/shipment-picks/picked/$id';

    
    var reqBody = {
      "photo": image != null
          ? 'data:image/png;base64,' + base64Encode(image.readAsBytesSync())
          : '',
      "signature": signature != null
          ? 'data:image/png;base64,' + base64Encode(signature)
          : '',
      // "signature": baseimg,
      "shipment_ids": shipment,
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