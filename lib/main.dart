import 'package:flutter/material.dart';
import 'package:hqc/login.dart';
import 'package:hqc/signup.dart';

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
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Container(
                width: mediaQuery.size.width * 0.90,
                child: Image.asset('assets/images/logo.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                        radius: 45,
                        child: ClipOval(
                            child:
                                Image.asset('assets/images/jwmf_freitas.jpg'))),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "João V. Freitas",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "@jwmf_freitas",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 190,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(_createRoute('login'));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Text("LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Roboto-Black')),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side: BorderSide(width: 2, color: Colors.white)),
                ),
              ),
              SizedBox(
                width: 190,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(_createRoute('signup'));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Text("CADASTRAR",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto-Black')),
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

Route _createRoute(dynamic button) {
  switch (button) {
    case 'signup':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignUpPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(2.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    default:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(2.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
  }
}
