import 'dart:async';
import 'dart:convert';
import 'package:flutter_ws_1/src/configs/config.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

List ?listResponse;
  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
   // Fect Shipment Data
    var client = http.Client();
    try {
      var response =
          await client.get(Uri.parse(backendUrl + '/api/v1/shipments'));
      print('Shipments : ' + response.body);

      print('Shipments : ' + response.statusCode.toString());

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // event --> block --> state
        var jsonResponse = jsonDecode(response.body);

        print(jsonResponse['data']);

        listResponse = jsonResponse['data'];
        print('listing:');
        print(listResponse![8]['content_items'].toString());
         print(listResponse![5]['waybill_number'].toString());
      }
    } catch (e) {     
      //log(e.toString());
    }
  }
}
