import 'dart:async';
import 'package:flutter_app_photo_gallery_v2/model/model.dart';
import 'package:flutter_app_photo_gallery_v2/resources/photo_api_call.dart';

class Repository {
  final photoApiCall = PhotoApiProvider();

  Future<ItemModel> fetchAllPhotos() => photoApiCall.fetchPhotoList();

  //add something

}
