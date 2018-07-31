import 'package:flutter/material.dart';
import 'package:raddit_picks_bloc/blocs/images_bloc_provider.dart';
import 'package:raddit_picks_bloc/models/image_model.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';

class ListScreen extends StatelessWidget {
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    final bloc = ImagesBlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Random Memes')),
      body: Container(
        child: StreamBuilder(
          stream: bloc.imagesListStream.stream,
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
    return Center(child: Image.network(image.url));
  }
}
