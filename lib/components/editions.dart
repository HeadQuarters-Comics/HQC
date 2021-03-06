import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class EditionsList extends StatefulWidget {
  final int editions;
  EditionsList(this.editions);

  @override
  _EditionsListState createState() => _EditionsListState();
}

class _EditionsListState extends State<EditionsList> {
  _launchURL() async {
    const url =
        'https://drive.google.com/file/d/1CKt3_XED95KZ6GTZwWHgyh1DDi0qFzxM/view?usp=sharing';
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  rendererHQ() {
    List<Widget> list = [];
    for (var i = 1; i <= widget.editions; i++) {
      list.add(Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _launchURL,
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  side: BorderSide(width: 2, color: Colors.black)),
              child: Container(
                child: Text(i < 10 ? "#0$i" : "#$i",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontFamily: 'ComicNeue-Bold')),
              ),
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
