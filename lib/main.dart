import "package:flutter/material.dart";
import './Login/loginForm.dart';
import './map/user.dart';
void  main()=>runApp(new MyApp());
class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData( 
primarySwatch: Colors.indigo
      ),
      home: MapScreen(),
    );
  }
}
  
