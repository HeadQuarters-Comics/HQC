import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HQRow extends StatefulWidget {
  @override
  _HQRowState createState() => _HQRowState();
}

class _HQRowState extends State<HQRow> {
  List? data;
  List? hqsData;

  getReleases() async {
    http.Response response =
        await http.get(Uri.parse('http://hqs-api:4000/api/hqs/releases'));
    debugPrint(response.body);
    data = json.decode(response.body);
    setState(() {
      hqsData = data ?? []; //['users'];
    });
    rendererHQ();
  }

  rendererHQ() {
    List<Widget> list = [];
    for (var hqs in hqsData ?? []) {
      //print(hqs);
      list.add(Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.30),
                  spreadRadius: 0,
                  blurRadius: 10,
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
    getReleases();
  }

  @override
  Widget build(BuildContext context) {
    //final mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: rendererHQ(),
    );
  }
}
