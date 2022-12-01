// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thoughts/auth/home_route.dart';
// import 'package:thoughts/login.dart';
// import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // hey();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCnM-t9yp-DNNq-CTcUB7bWN3HaozCMe3A",
          appId: "1:864499648136:android:8f007eb7fb5fe06846013d",
          messagingSenderId: "864499648136",
          projectId: "thoughts-5dac5"));
  runApp(const MyApp());
}

// Future<FirebaseApp> hey({String? name, FirebaseOptions? options}) async {
//   // TODO: implement hey
//   await Firebase.initializeApp;
//   // throw UnimplementedError();
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// ignore: non_constant_identifier_names

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomeRoute(),
    );
  }
}
