import 'package:flutter/material.dart';
import 'package:raddit_picks_bloc/blocs/images_bloc_provider.dart';
import 'package:raddit_picks_bloc/models/image_model.dart';
import 'dart:async';

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
                        return emptyImage();
                      }
                      return imageWidget(imageSnapshot.data);
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

  Widget emptyImage() {
    return Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        color: Colors.grey[400],
      ),
    );
  }

  Widget imageWidget(ImageModel image) {
    //corregir: mostrar indicador de que la imagen carga no que desaparezca elplaceholder y luego aparezca la imagen
    return Center(child: Text('${image.width}+${image.height}'));
  }
}
