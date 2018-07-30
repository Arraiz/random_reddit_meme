import 'package:flutter/material.dart';
import 'package:raddit_picks_bloc/screens/list_screen.dart';
import 'package:raddit_picks_bloc/blocs/images_bloc_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImagesBlocProvider(
      child: MaterialApp(
        title: 'Reddit Memes',
        home: ListScreen(),
      ),
    );
  }
}
