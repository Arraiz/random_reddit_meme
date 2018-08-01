class ImageModel {
  final String url;
  final String title;
  final int width;
  final int height;

  ImageModel({this.title, this.url, this.width, this.height});

  ImageModel.fromJson(List<dynamic> parsedJson)
      : url = parsedJson[0]['data']['children'][0]['data']['preview']['images']
            [0]['source']['url'],
        title = parsedJson[0]['data']['children'][0]['data']['title'],
        width = parsedJson[0]['data']['children'][0]['data']['preview']
            ['images'][0]['source']['width'],
        height = parsedJson[0]['data']['children'][0]['data']['preview']
            ['images'][0]['source']['height'];
}
