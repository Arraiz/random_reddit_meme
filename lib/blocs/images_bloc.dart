import 'package:rxdart/rxdart.dart';
import 'package:raddit_picks_bloc/repository/repository.dart';
import 'package:raddit_picks_bloc/models/image_model.dart';
import 'dart:async';

class ImagesBloc {
  final imagesController = PublishSubject<Future<ImageModel>>();
  final imagesListStream = BehaviorSubject<Map<int, Future<ImageModel>>>();
  final Repository repo = Repository();

  fetchImage() async {
    imagesController.sink.add(repo.fetchImage());
  }




  dispose() {
    imagesController.close();
    imagesListStream.close();
  }
}
