import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String url = "https://api.covid19api.com/summary";
 List data;
  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<dynamic> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['Countries'];
    });
    print(data);
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Covid updates')),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                    child: Container(
                  child: Text(data[index]['Country']),
                  padding: EdgeInsets.all(20.0),
                )),
                Card(
                    child: Container(
                  child: Text(data[index]['CountryCode']),
                  padding: EdgeInsets.all(20.0),
                )),
                Card(
                    child: Container(
                  child: Text(data[index]['Slug']),
                  padding: EdgeInsets.all(20.0),
                )),
                Card(
                    child: Container(
                  child: (data[index]['NewConfirmed']),
                  padding: EdgeInsets.all(20.0),
                )),
                Card(
                    child: Container(
                  child: Text(data[index]['TotalConfirmed']),
                  padding: EdgeInsets.all(20.0),
                )),
                Card(
                    child: Container(
                  child: Text(data[index]['NewDeaths']),
                  padding: EdgeInsets.all(20.0),
                )),
                Card(
                    child: Container(
                  child: Text(data[index]['TotalDeaths']),
                  padding: EdgeInsets.all(20.0),
                )),
                Card(
                    child: Container(
                  child: Text(data[index]['NewRecovered']),
                  padding: EdgeInsets.all(20.0),
                )),
                Card(
                    child: Container(
                  child: Text(data[index]['TotalRecovered']),
                  padding: EdgeInsets.all(20.0),
                )),
                Card(
                    child: Container(
                  child: Text(data[index]['Date']),
                  padding: EdgeInsets.all(20.0),
                )),
              ],
            )),
          );
        },
      ),
    );
  }
}
