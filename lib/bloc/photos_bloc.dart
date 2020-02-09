import 'package:flutter_app_photo_gallery_v2/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app_photo_gallery_v2/model/model.dart';

class PhotosBloc {
  final _repository = Repository();
  final _photosFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allPhotos => _photosFetcher.stream;

  Future<Null> fetchAllPhotos() async {
    ItemModel itemModel = await _repository.fetchAllPhotos();
    _photosFetcher.sink.add(itemModel);
    return null;
  }

  dispose() {
    _photosFetcher.close();
  }
}

final bloc = PhotosBloc();
