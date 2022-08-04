import 'package:appto/home.dart';
// import 'package:appto/splash.dart';
import 'package:appto/providers/todo_provider.dart';
import 'package:appto/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    // ignore: prefer_const_constructors
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TodoProvider())
        ],
        child: MaterialApp(
          title: 'ToDo App',
          home: Splash(),
        ));
  }
}
