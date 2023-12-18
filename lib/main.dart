import 'package:flutter/material.dart';
import 'package:store/components/constants.dart';
import 'package:store/widgets_tree.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        home: const WidgetTree(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Constants.kDeepBlue,
                canvasColor: Constants.kCleanColorBege
        ),
    );
  }
}