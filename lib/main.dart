import 'package:flutter/material.dart';
import 'package:home_smart_2/screen/detail/detail_screen.dart';
import 'package:home_smart_2/screen/energy/energy_screen.dart';
import 'package:home_smart_2/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen()
    );
  }
}


