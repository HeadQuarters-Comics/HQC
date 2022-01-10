import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HQList extends StatefulWidget {
  @override
  _HQListState createState() => _HQListState();
}

class _HQListState extends State<HQList> {
  List? data;
  List? hqsData;

  getHQs() async {
    http.Response response =
        await http.get(Uri.parse('http://192.168.88.253:4000/api/hqs/'));
    debugPrint(response.body);
    data = json.decode(response.body);
    setState(() {
      hqsData = data!; //['users'];
    });
    rendererHQ();
  }

  rendererHQ() {
    List<Widget> list = [];
    for (var hqs in hqsData!) {
      print(hqs);
      list.add(Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.30),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(-3, 4), // changes position of shadow
                ),
              ]),
              width: 170,
              height: 255,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    '${hqs?['image']}',
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text("${hqs?['name']}",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 17,
                      fontFamily: 'ComicNeue-Bold')),
            )
          ],
        ),
      ));
    }
    return new Wrap(children: list);
  }

  @override
  void initState() {
    super.initState();
    getHQs();
  }

  @override
  Widget build(BuildContext context) {
    //final mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: rendererHQ(),
        ),
      ),
    );
  }
}
