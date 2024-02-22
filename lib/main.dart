import "package:bus_booking/screens/confirm_screen.dart";
import "package:bus_booking/screens/first_screen.dart";
import 'package:bus_booking/screens/seat_selection.dart';
import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark, 
      home: Homepage(),
    );
  }
}