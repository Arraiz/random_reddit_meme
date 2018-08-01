import 'package:flutter/material.dart';
import 'package:raddit_picks_bloc/blocs/images_bloc_provider.dart';
import 'package:raddit_picks_bloc/models/image_model.dart';
import 'dart:async';
import 'package:http/http.dart' show BaseClient;

class ListScreen extends StatelessWidget {
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    final bloc = ImagesBlocProvider.of(context);
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(title: Text('Random Memes')),
      body: Container(
        child: StreamBuilder(
          stream: bloc.imagesListStream.stream,
          builder:
              (context, AsyncSnapshot<Map<int, Future<ImageModel>>> snapshot) {
            if (!snapshot.hasData) {
              return Text('NO MEMES YET D:');
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future: snapshot.data[index],
                    builder:
                        (context, AsyncSnapshot<ImageModel> imageSnapshot) {
                      if (!imageSnapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return emptyImage(
                          imageSnapshot.data.height, imageSnapshot.data.width);
                    },
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        bloc.fetchImage();
      }),
    );
  }

  Widget emptyImage(int height, int width) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
        height: height.toDouble(),
        width: (width.toDouble()),
        color: Colors.grey[400],
        child: Divider(
          height: 20.0,
        ),
      ),
    );
  }

  Future<Widget> imageWidget(ImageModel image) async {
    //corregir: mostrar indicador de que la imagen carga no que desaparezca elplaceholder y luego aparezca la imagen
  }
}
