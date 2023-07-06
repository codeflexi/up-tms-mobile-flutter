import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_ws_1/src/configs/config.dart';
import 'package:flutter_ws_1/src/constants/parameter.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_ws_1/src/constants/global.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserRepo {
  static void setUserToken(String token) {
    Global.storageService
        .setString(AppParameters.STORAGE_USER_TOKEN_KEY, token);

    print('Storage Token');
    print(Global.storageService.getUserToken());

    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(token);
    Global.storageService.setString(
        AppParameters.STORAGE_USER_PROFILE_KEY, jwtDecodedToken['id']);

    print('Storage UserName');
    print(Global.storageService.getUserProfileKey());
  }

  static void clearUserToken() {
    Global.storageService.setString(AppParameters.STORAGE_USER_TOKEN_KEY, '');

    print('Storage Token');
    print(Global.storageService.getUserToken());

    Global.storageService.setString(AppParameters.STORAGE_USER_PROFILE_KEY, '');

    print('Storage UserName');
    print(Global.storageService.getUserProfileKey());
  }

  static Future<bool> userLogin(String user, String password) async {
    late bool returnResult = false;

    if (user.isEmpty || password.isEmpty) {
      return false;
    }

    if (user.isNotEmpty && password.isNotEmpty) {
      var reqBody = {"email": user, "password": password};

      var response = await http.post(Uri.parse(login),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['success']) {
        print("user logged in");

        var myToken = jsonResponse['token'];
        setUserToken(myToken);
        returnResult = true;
      } else {
        returnResult = false;
      }
    }
    return returnResult;
  }

  static Future<bool> userLogout() async {
    late bool returnResult = false;

    var client = http.Client();
    // List listResponse = [];

    try {
      String token = Global.storageService.getUserToken();

      var response = await http.get(Uri.parse(logout), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // event --> block --> state

        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse['success']) {
          //clear Token
          clearUserToken();
          returnResult = true;
        } else {
          returnResult = false;
        }
      }
    } catch (e) {
      print(e);
      return false;

      //log(e.toString());
    }
    return returnResult;
  }
}
