import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:async';
//import 'dart:convert';

class HQList extends StatefulWidget {
  @override
  _HQListState createState() => _HQListState();
}

class _HQListState extends State<HQList> {
  @override
  Widget build(BuildContext context) {
    //final mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            children: [
              Padding(
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
    );
  }
}
