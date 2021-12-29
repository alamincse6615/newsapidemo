import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/2ndpage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
        (){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context)=>imam(),
              )
          );
        }

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
      Image.asset('assets/coffes.png')
    ],
  ),
),
    );
  }
}
