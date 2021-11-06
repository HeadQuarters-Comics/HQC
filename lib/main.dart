import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HQC',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LoggedOutPage(),
    );
  }
}

class LoggedOutPage extends StatefulWidget {
  @override
  _LoggedOutState createState() => _LoggedOutState();
}

class _LoggedOutState extends State<LoggedOutPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              width: mediaQuery.size.width * 0.90,
              child: Image.asset('assets/images/logo.png')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Text("LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side: BorderSide(width: 2, color: Colors.white)),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Text("CADASTRAR",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(width: 2, color: Colors.white)),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
