
import 'dart:io';

class PickupDetailDataModel {
  final String pick_id;
  final String pick_number;
  final File image;
  final File signature;


  PickupDetailDataModel({
    required this.pick_id,
    required this.pick_number,
    required this.image,
    required this.signature
});

}

// Empty List
//picdata = const <PickupDetailDataModel>[];