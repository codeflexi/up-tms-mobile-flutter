// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UseresDataModel {
  final String user_id;
  final String user_email;
  final String user_name;
  final String? user_lastname;
   final String user_role;
   final String? user_avatar;
  // final Map<String,Object> address;
  // final Map<String,Object> cod;

  UseresDataModel({
    required this.user_id,
    required this.user_email,
    required this.user_name,
    this.user_lastname,
    this.user_avatar,
    required this.user_role,
   
  });

  factory UseresDataModel.fromJson(Map<String, dynamic> json) {
    //  if (json == null) {
    //   return;
    // }
       return UseresDataModel(
        user_id: json['_id'] ?? '',
        user_email: json['email'] ?? '',
        user_name: json['name'] ?? '',
        user_lastname: json['last_name'] ?? '',
        user_role: json['role']['name']?? '',
        user_avatar: json['image'] ?? '',
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