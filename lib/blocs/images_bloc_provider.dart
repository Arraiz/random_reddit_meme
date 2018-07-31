import 'package:flutter/material.dart';
import 'package:raddit_picks_bloc/blocs/images_bloc.dart';
export 'package:raddit_picks_bloc/blocs/images_bloc.dart';

class ImagesBlocProvider extends InheritedWidget {
  final ImagesBloc bloc;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  ImagesBlocProvider({Key key, Widget child})
      : bloc = ImagesBloc(),
        super(key: key, child: child);

  static ImagesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ImagesBlocProvider) as ImagesBlocProvider).bloc;
  }
}
