import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_demo/splash.dart';

import 'homepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sports',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen()
    );
  }
}

//https://jsonplaceholder.typicode.com/posts//