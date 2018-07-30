class ImageModel {
  final String url;
  final String title;

  ImageModel({this.title, this.url});

  ImageModel.fromJson(List<dynamic> parsedJson)
      : url = parsedJson[0]['data']['children'][0]['data']['preview']['images'][0]['source']['url'],
        title = parsedJson[0]['data']['children'][0]['data']['title'];


}
