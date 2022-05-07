import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'components/export.dart' as Components;
import 'package:url_launcher/url_launcher.dart';

class HQPage extends StatefulWidget {
  final Object hq;
  HQPage(this.hq);
  @override
  _HQState createState() => _HQState();
}

class _HQState extends State<HQPage> {
  List? data;
  List? publishersData;

  get hq => widget.hq;

  @override
  void initState() {
    super.initState();
    print(widget.hq);
  }

  _launchURL() async {
    String url = hq['buy'];
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black,
                        spreadRadius: -1.0,
                        blurRadius: 4.0,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000.0),
                    child: ClipRect(
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 0.9,
                          heightFactor: 0.6,
                          child: Image.network('${hq['image']}'),
                        ),
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  Text('${hq['name']}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'ComicNeue-Bold')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text('Lançamento: ${hq['release']}',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16,
                                fontFamily: 'ComicNeue-Bold')),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          children: [
                            Text('Nota: ${hq['rating']}',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16,
                                    fontFamily: 'ComicNeue-Bold')),
                            Icon(
                              Icons.star,
                              color: Colors.black.withOpacity(0.5),
                              size: 15.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text('${hq['number_edits']} edições',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16,
                                fontFamily: 'ComicNeue-Bold')),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 175,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.star_border,
                                    color: Colors.black,
                                    size: 25.0,
                                  ),
                                ),
                                Text("AVALIAR",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Roboto-Black')),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              side: BorderSide(width: 2, color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        width: 175,
                        child: ElevatedButton(
                          onPressed: _launchURL,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.shopping_basket_rounded,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                                Text("COMPRAR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Roboto-Black')),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              side: BorderSide(width: 0, color: Colors.red)),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Text('${hq['desc']}',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                            fontFamily: 'ComicNeue-Bold')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 2.0,
                          width: 120.0,
                          color: Colors.black,
                        ),
                      ),
                      Text("LEIA ONLINE",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontFamily: 'Roboto-Black')),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 2.0,
                          width: 120.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Components.EditionsList(hq['number_edits'])
                ],
              ),
            )
          ])),
        ));
  }
}
