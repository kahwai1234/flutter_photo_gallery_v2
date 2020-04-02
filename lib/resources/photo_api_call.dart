import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:flutter_app_photo_gallery_v2/model/model.dart';
import 'dart:math';

class PhotoApiProvider {
  var num = Random();
  Client client = Client();
  Future<ItemModel> fetchPhotoList() async {
    var num1 = num.nextInt(96) + 4;
    final response = await client
        .get("https://picsum.photos/v2/list?page=2&limit=$num1");
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200');
      print(response.body);
      // If the call to the  server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}