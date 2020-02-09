class ItemModel {
  List<_Result> _results = [];

  ItemModel.fromJson(List<dynamic> parsedJson) {
    List<_Result> temp = [];
    print('100');
    print(parsedJson);
    for (int i = 0; i < 4; i++) {
      _Result result = _Result(parsedJson[i]);
      temp.add(result);
    }
    _results = temp;
    print(temp);
  }
  List<_Result> get results => _results;
}

class _Result {
  String _url;
  int _width;
  int _height;
  String _id;
  String _author;
  String _downloadUrl;


  _Result(result) {
    _url = result['url'];
    _width = result['width'];
    _height = result['height'];
    _id = result['id'];
    _author = result['author'];
    _downloadUrl = result['download_url'];
  }

  String get url => _url;

  String get id => _id;

  String get author => _author;

  String get download_url => _downloadUrl;

  int get width => _width;

  int get height => _height;

}
