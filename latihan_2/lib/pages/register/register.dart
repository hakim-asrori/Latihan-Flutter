
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:latihan_2/pages/login/login.dart';

class Register extends StatefulWidget {
  @override 
  _RegisterState createState() => new _RegisterState();
}

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
final _key = new GlobalKey<FormState>();

class _RegisterState extends State<Register> {
  Dio dio = new Dio();

  TextEditingController _controllerNama = new TextEditingController();
  TextEditingController _controllerTelepon = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

  // Fungsi Register
  Future<void> _registerProses() async {
    try {
      Response response;

      response = await dio.post(
        "http://17.8.19.62:8000/register.php", 
        data: FormData.fromMap({
          "nama": "${_controllerNama.text}",
          "telepon": "${_controllerTelepon.text}",
          "password": "${_controllerPassword.text}",
        })
      );

      print(response.data);
      if(response.data['status']==1){
        setState(() {
          _controllerNama.text="";
          _controllerTelepon.text="";
          _controllerPassword.text="";
        });
        setState(() {
          successTampil();
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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

    // Text Silahkan Register
    final silahkanRegister = Text(
      'Silahkan Registrasi',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24
      ),
    );

    // Label login
    final loginLabel = FlatButton(
      child: Text(
        'Login!',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
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
              silahkanRegister,
              SizedBox(height: 48.0),

              // Bagian Form Nama
              TextFormField(
                controller: _controllerNama,
                keyboardType: TextInputType.name,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Nama',
                  // filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                ),
              ),
              SizedBox(height: 8.0),

              // Bagian Form Telepon
              TextFormField(
                controller: _controllerTelepon,
                keyboardType: TextInputType.phone,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Telepon',
                  // filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                ),
              ),
              SizedBox(height: 8.0),

              // Bagian Form Password
              TextFormField(
                controller: _controllerPassword,
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  // filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                ),
              ),
              SizedBox(height: 24.0),

              // Bagian Tombol Register
              ElevatedButton(
                onPressed: () {                  
                  if (_controllerNama.text == "" || _controllerPassword.text == "" || _controllerTelepon.text == "") {
                    errorTampil();
                  } else {
                    _registerProses();
                  }
                },
                child: Text('Register', style: TextStyle(color: Colors.white)),
              ),
              loginLabel
            ],
          ),
        ),
      )
    );
  }

  void errorTampil() {
    Fluttertoast.showToast(
      msg: "REGISTER GAGAL, HARAP PERIKSA FORM!",
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
      msg: "REGISTRASI SUKSES!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}