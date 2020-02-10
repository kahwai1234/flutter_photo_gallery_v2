import 'package:flutter/material.dart';
import 'package:flutter_app_photo_gallery_v2/model/model.dart';
import 'package:flutter_app_photo_gallery_v2/bloc/photos_bloc.dart';

class PhotoGallery extends StatefulWidget {
  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> handleRefresh() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(seconds: 2));
    // delayed 2 seconds for new data loading
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('inti state');
    bloc.fetchAllPhotos();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose');
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text('Photo Gallery'),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder(
        stream: bloc.allPhotos,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            print('got data');
            print(snapshot.data.results.length);
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: bloc.fetchAllPhotos,
      child: ListView.builder(
        itemCount: snapshot.data.results.length,
        itemBuilder: (context, i) => GestureDetector(
          onLongPressStart: (details) {
            handleRefresh();
            print('longPress');
          },
          child: SafeArea(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.only(top: 8, right: 8, left: 8),
                elevation: 3.0,
                child :Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: snapshot.data.results[i].width /
                          snapshot.data.results[i].height,
                      child: Image.network(snapshot.data.results[i].download_url),
                    ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
