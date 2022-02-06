import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:latihan_2/models/user.dart';
import 'package:latihan_2/pages/login/login.dart';

class Home extends StatelessWidget {
  ScreenArguments argumen = new ScreenArguments(argumen)

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text(
          this.nama,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  // @override 
  // _HomeState createState() => _HomeState();
}

// class _HomeState extends State<Home> {
  
// }