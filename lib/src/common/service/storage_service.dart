import 'package:flutter/cupertino.dart';
import 'package:flutter_ws_1/src/constants/parameter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;
  
  Future<StorageService> int() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

Future<bool> setBool(String key,bool value) async{
  return await _prefs.setBool(key,value);
}


Future<bool> setString(String key,String value) async {
 return await _prefs.setString(key,value );
}

bool getDeviceFirstOpen() {
  return _prefs.getBool(AppParameters.STORAGE_DEVICE_OPEN_FIRST_TIME)??false;
}

bool getIsLoggedIn() {
  return _prefs.getString(AppParameters.STORAGE_USER_TOKEN_KEY)==null?false:true;
}

String getUserToken() {
  return _prefs.getString(AppParameters.STORAGE_USER_TOKEN_KEY)??'';
}

String getUserProfileKey() {
  return _prefs.getString(AppParameters.STORAGE_USER_PROFILE_KEY)??'';
}


}