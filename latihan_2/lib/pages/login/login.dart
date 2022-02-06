import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latihan_2/models/user.dart';
import 'package:latihan_2/pages/home.dart';
import 'package:latihan_2/pages/register/register.dart';

class ScreenArguments {
  final String argumen;

  ScreenArguments(this.argumen);
}

class Login extends StatefulWidget {
  @override 
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  Dio dio = new Dio();
  final _key = new GlobalKey<FormState>();
  TextEditingController _controllerTelepon = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

  Future<void> _loginProses() async {
    try {
      var session = new FlutterSession();
      Response response;

      response = await dio.post(
        "http://17.8.19.62:8000/login.php", 
        data: FormData.fromMap({
          "telepon": "${_controllerTelepon.text}",
          "password": "${_controllerPassword.text}",
        })
      );
      
      if(response.data['status']==1){
        setState(() {
          _controllerTelepon.text="";
          _controllerPassword.text="";
        });
        setState(() {
          successTampil();
        });
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        Navigator.pushNamed(context, '/home', arguments: ScreenArguments(response.data['nama']));
      } else {
        setState(() {
          errorTampil();
        });
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  @override 
  Widget build(BuildContext context) {
    // Logo
    final logo = Hero(tag: 'hero', child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Image.asset('assets/img/logo.png'),
    ));

    // Text Silahkan Login
    final silahkanLogin = Text(
      'Silahkan Login',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24
      ),
    );

    // Form Telepon
    final telepon = TextFormField(
      controller: _controllerTelepon,
      keyboardType: TextInputType.phone,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Telepon',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );
    
    // Form Password
    final password = TextFormField(
      controller: _controllerPassword,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    // Tombol Login
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            if (_controllerPassword.text == "" || _controllerTelepon.text == "") {
              errorTampil();
            } else {
              _loginProses();
            }
          },
          child: Text('Login', style: TextStyle(color: Colors.white)),
        ),
      )
    );

    // Label registrasi
    final registerLabel = FlatButton(
      child: Text(
        'Registrasi Akun!',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Register())),
    );

    // Bagian untuk menampilakan
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              silahkanLogin,
              SizedBox(height: 48.0),
              telepon,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              registerLabel
            ],
          ),
        ),
      )
    );
  }

  void errorTampil() {
    Fluttertoast.showToast(
      msg: "LOGIN GAGAL, HARAP PERIKSA FORM!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  void successTampil() {
    Fluttertoast.showToast(
      msg: "LOGIN SUKSES!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
  
}