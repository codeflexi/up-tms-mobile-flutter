import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';


import 'package:flutter_ws_1/src/common/models/shipments_data_model.dart';
import 'package:flutter_ws_1/src/configs/config.dart';
import 'package:flutter_ws_1/src/constants/global.dart';
import 'package:http/http.dart' as http;

class DirectRepo {

static Future<List<ShipmentsDataModel>> fetchShipment(String id) async {
    var client = http.Client();
    // List listResponse = [];
    List<ShipmentsDataModel> shipments = [];
    //  String id = Global.storageService.getUserProfileKey();
   
   //&sort=-planned_date&
      String uri = '/api/v1/shipments?is_by_pass=Y&sort=picking_date&status=PICKING UP&driver=$id';
    try {
      var response = await client.get(Uri.parse(backendUrl + uri));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // event --> block --> state
        var jsonResponse = jsonDecode(response.body);

        List result = jsonResponse['data'];

        for (int i = 0; i < result.length; i++) {
          ShipmentsDataModel shipment =
              ShipmentsDataModel.fromJson(result[i] as Map<String, dynamic>);
          shipments.add(shipment);
        }

  
      }
    } catch (e) {
      // pickups = [];
      return shipments;

      //log(e.toString());
    }
    return shipments;
  }


 static Future<bool> updateShipment(
      String id, File image, Uint8List signature) async {
    late bool returnResult = false;

    var client = http.Client();
    // List listResponse = [];
    //const String pick_id = id;
    String uri = '/api/v1/shipments/direct-pickup/$id';

    var reqBody = {
      "photo": image != null
          ? 'data:image/png;base64,' + base64Encode(image.readAsBytesSync())
          : '',
      "signature": signature != null
          ? 'data:image/png;base64,' + base64Encode(signature)
          : ''
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

      }
    } catch (e) {
      print(e);
      // pickups = [];
      return false;

      //log(e.toString());
    }
    return returnResult;
  }


static Future<bool> updateUnDelivery(
      String id, String reason ) async {
    late bool returnResult = false;

    var client = http.Client();
    // List listResponse = [];
    //const String pick_id = id;
    String uri = '/api/v1/shipments/un-dispatch/$id';

      //  const apiURL = `/api/v1/shipments/un-dispatch/${id}`;
      //   const update = {
      //     reason: data.reason
      //   }

    var reqBody = {
      "reason": reason,
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





//  async updateUnDispatch(id, data) {
//       try {
//         const apiURL = `/api/v1/shipments/un-dispatch/${id}`;
//         const update = {
//           reason: data.reason
//         }
//         return await server.put(apiURL, update)
//       } catch (error) {
//         if (error) throw error
//       }
//     },




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