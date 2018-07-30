import 'package:raddit_picks_bloc/providers/image_provider.dart';
import 'package:raddit_picks_bloc/models/image_model.dart';
import 'dart:async';

class Repository {
  ImageProvider ip = ImageProvider();

  Future<ImageModel> fetchImage() async {
    return await ip.fetchImage();
  }
}
