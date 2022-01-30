import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'components/export.dart' as Components;

class HQPage extends StatefulWidget {
  @override
  _HQState createState() => _HQState();
}

class _HQState extends State<HQPage> {
  List? data;
  List? publishersData;

  //getEditions() async {
  //  http.Response response = await http
  //      .get(Uri.parse('http://192.168.43.93:4000/api/hqs/'));
  //  debugPrint(response.body);
  //  data = json.decode(response.body);
  //  setState(() {
  //    publishersData = data ?? [];
  //    selected = publishersData != null
  //        ? publishersData![0]['publisher']
  //        : 'DC COMICS';
  //  });
  //  //rendererPublishers();
  //}

  //rendererEditions() {
  //  List<Widget> list = [];
  //  for (var publisher in publishersData ?? []) {
  //    //print(publisher);
  //    //print(selected);
  //    list.add(Padding(
  //      padding: const EdgeInsets.only(right: 10),
  //      child: Column(
  //        children: [
  //          InkWell(
  //            onTap: () {
  //              setState(() {
  //                selected = publisher?['publisher'];
  //              });
  //            },
  //            child: Container(
  //              decoration: BoxDecoration(
  //                  border: Border(
  //                      bottom: BorderSide(
  //                          color: publisher?['publisher'] == selected
  //                              ? Colors.black
  //                              : Colors.white,
  //                          width: 1))),
  //              child: Text("${publisher?['publisher']}",
  //                  style: TextStyle(
  //                      color: publisher?['publisher'] == selected
  //                          ? Colors.black
  //                          : Colors.grey,
  //                      fontSize: 15,
  //                      fontFamily: 'Roboto-Black')),
  //            ),
  //          ),
  //        ],
  //      ),
  //    ));
  //  }
  //  return new Row(children: list);
  //}

  @override
  void initState() {
    super.initState();
    //getEditions();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
        appBar: AppBar(
          //title: Text('A THOR'),
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
                          child: Image.network(
                              'https://media.discordapp.net/attachments/909080456316735498/931334317618110484/unknown.png?width=439&height=676'),
                        ),
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  Text('HERÓIS EM CRISE',
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
                        child: Text('Lançamento: 2016',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16,
                                fontFamily: 'ComicNeue-Bold')),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text('Nota: 5',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16,
                                fontFamily: 'ComicNeue-Bold')),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text('08 edições',
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
                                vertical: 10, horizontal: 0),
                            child: Text("AVALIAR",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Roboto-Black')),
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
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text("COMPRAR",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Roboto-Black')),
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
                    child: Text(
                        'Jane Foster é a Deusa do Trovão, e isso a está matando! Seus inimigos são muitos, à medida que Asgard afunda ainda mais em direção ao caos e a inquietação ameaça se espalhar pelos Dez Reinos. Ainda assim, ela trava sua maior batalha contra um inimigo muito mais pessoal: o câncer que está matando sua forma mortal. Quando Loki voltar, isso aliviará seus problemas ou apenas aumentará sua dor?',
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
                ],
              ),
            )
          ])),
        ));
  }
}
