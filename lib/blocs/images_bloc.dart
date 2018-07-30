import 'package:rxdart/rxdart.dart';
import 'package:raddit_picks_bloc/models/image_model.dart';
import 'package:raddit_picks_bloc/repository/repository.dart';
import 'package:raddit_picks_bloc/models/image_model.dart';
import 'dart:async';
class ImagesBloc{

 final imagesController = PublishSubject();
 final Repository repo = Repository();


 fetchImage() async {
   final  image = await repo.fetchImage();
   imagesController.sink.add(image);
 }

 dispose(){
   imagesController.close();
 }




}