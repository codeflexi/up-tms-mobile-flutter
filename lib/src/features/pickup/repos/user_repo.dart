import 'dart:convert';


import 'package:flutter_ws_1/src/features/pickup/models/pickup.dart';
import 'package:flutter_ws_1/src/features/pickup/repos/user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));
   
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

  //  for (int i = 0; i < result.length; i++) {
  //         PickupDataModel pickup =
  //             PickupDataModel.fromJson(result[i] as Map<String, dynamic>);
  //         pickups.add(pickup);
  //       }