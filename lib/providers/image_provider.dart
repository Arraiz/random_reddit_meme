import 'package:raddit_picks_bloc/models/image_model.dart';
import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';


class ImageProvider {

  Client _client = Client();
  final String url = 'https://www.reddit.com/r/simpsonsshitposting/random.json?count=2';


  Future<ImageModel> fetchImage() async {
    //get the raw json
    final  response = await _client.get(url);
    final decJson = json.decode(response.body);
    final image = ImageModel.fromJson(decJson);
    return image;

  }




}

