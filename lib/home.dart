import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'components/export.dart' as Components;

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List? data;
  List? publishersData;

  String selected = '';

  getPublishers() async {
    http.Response response =
        await http.get(Uri.parse('http://hqs-api:4000/api/hqs/publishers'));
    debugPrint(response.body);
    data = json.decode(response.body);
    setState(() {
      publishersData = data ?? [];
      selected = publishersData != null
          ? publishersData![0]['publisher']
          : 'DC COMICS';
    });
    //rendererPublishers();
  }

  rendererPublishers() {
    List<Widget> list = [];
    for (var publisher in publishersData ?? []) {
      //print(publisher);
      //print(selected);
      list.add(Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selected = publisher?['publisher'];
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: publisher?['publisher'] == selected
                                ? Colors.black
                                : Colors.white,
                            width: 1))),
                child: Text("${publisher?['publisher']}",
                    style: TextStyle(
                        color: publisher?['publisher'] == selected
                            ? Colors.black
                            : Colors.grey,
                        fontSize: 15,
                        fontFamily: 'Roboto-Black')),
              ),
            ),
          ],
        ),
      ));
    }
    return new Row(children: list);
  }

  @override
  void initState() {
    super.initState();
    getPublishers();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                  width: mediaQuery.size.width * 1,
                  child: Image.asset('assets/images/name.png')),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text('LANÇAMENTOS',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Roboto-Black')),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 30),
                child: Components.HQRow()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 2.0,
                    width: 70.0,
                    color: Colors.black,
                  ),
                ),
                Text("SUGESTÕES PARA VOCÊ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontFamily: 'Roboto-Black')),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 2.0,
                    width: 70.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 15),
                child: rendererPublishers()),
            Components.HQList(selected)
          ],
        )),
      ),
    );
  }
}
