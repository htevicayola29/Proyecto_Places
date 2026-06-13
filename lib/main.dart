import 'package:flutter/material.dart';
import 'places.dart';
import 'places_cupertino.dart';
import 'login_page.dart';
import 'home.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Places",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Cambiamos PlacesCupertino() por LoginPage() para que inicie ahí
      home: const LoginPage(),
    );
  }
}