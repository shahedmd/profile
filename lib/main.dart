import 'package:flutter/material.dart';
import 'package:flutter_application_1/user.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    

    return MaterialApp(home: UserPage(),);
  }
}