import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.30),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset:
                                    Offset(-3, 4), // changes position of shadow
                              ),
                            ]),
                            width: 170,
                            height: 255,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  'https://cdn.discordapp.com/attachments/903283287009685507/908852482149613568/Spdr2.JPG',
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text("HQ de teste VOL. 45",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 17,
                                    fontFamily: 'ComicNeue-Bold')),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 1))),
                          child: Text("DC COMICS",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Roboto-Black')),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white, width: 1))),
                          child: Text("MARVEL",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: 'Roboto-Black')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
