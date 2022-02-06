import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_1/constans.dart';
import 'package:latihan_1/model/kategori.dart';
import 'dart:async';
import 'dart:convert';

class DepanPage extends StatefulWidget {
  @override
  State<DepanPage> createState() => _DepanPageState();
}

class _DepanPageState extends State<DepanPage> {
  List<Kategori> kategoriList = [];

  @override
  void initState() {
    super.initState();
    fetchKategori();
  }

  @override
  void dispose() {
    super.dispose();
    kategoriList = [];
  }

  Future fetchKategori() async {
    List<Kategori> usersList;
    var params = "/test.php";
    try {
      var url = Uri.http('127.0.0.1', 'coba-flutter/test.php');
      var jsonResponse = await http.get('https://newsapi.org/v2/everything?q=Apple&from=2022-02-05&sortBy=popularity&apiKey=da21ed0626fc4f0a93468fa7bf348c3c');
      print(jsonResponse);
      if (jsonResponse.statusCode == 200) {
        final jsonItems = json.decode(jsonResponse.body);

        setState(() {
          kategoriList = jsonItems['articles'];
        });
        
      }
    } catch (e) {
      print(e);
    }

    return usersList = [];
  }

  Future<Null> _refresh() {
    return fetchKategori().then((_kategori) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  produkByKategori(),
                ]),
          ),
        ]),
      ),
    );
  }

  Widget produkByKategori() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          for (int i = 0; i < kategoriList.length; i++)
            WidgetbyKategori(
                kategoriList[i].id, kategoriList[i].nama.toString(), i, child: null!,),
          
        ],
      ),
    );
  }
}

class WidgetbyKategori extends StatefulWidget {
  final Widget child;
  final int id;
  final String kategori;
  final int warna;

  const WidgetbyKategori(this.id, this.kategori, this.warna,
      {Key? key, required this.child})
      : super(key: key);

  @override
  _WidgetbyKategoriState createState() => _WidgetbyKategoriState();
}

class _WidgetbyKategoriState extends State<WidgetbyKategori> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.only(right: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    widget.kategori,
                    style: TextStyle(color: Colors.white),
                  ),
                  width: 200.0,
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    color: Palette.colors[widget.warna],
                    boxShadow: [
                      BoxShadow(
                          color: Palette.colors[widget.warna], spreadRadius: 1),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    /*
                    Navigator.of(context).push(MaterialPageRoute<Null> (
                      builder: (BuildContext context) {
                        return new ProdukPage(
                          "kat", widget.id, 0, widget.kategori
                        );
                      }));

                     */
                  },
                  child: Text('Selengkapnya',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}