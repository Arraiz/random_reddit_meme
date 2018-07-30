
import 'package:raddit_picks_bloc/repository/repository.dart';
import 'package:raddit_picks_bloc/models/image_model.dart';
import 'dart:async';
import 'package:raddit_picks_bloc/blocs/images_bloc.dart';


void main(){

final bloc = ImagesBloc();

bloc.fetchImage();

bloc.imagesController.stream.listen((data){
  print(data);
});



}