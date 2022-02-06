import 'package:flutter/material.dart';
import 'package:latihan_2/pages/home.dart';
import 'package:latihan_2/pages/register/register.dart';
import 'pages/login/login.dart';

void main() => runApp(MyApp());

String nama = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rumah Tahfidz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: Login(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new Home(),
        '/login': (BuildContext context) => new Login(),
        '/register': (BuildContext context) => new Register(),
      },
    );
  }
}