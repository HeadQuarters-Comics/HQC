import 'package:flutter/material.dart';
import 'package:hqc/home.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  String username = '';
  String password = '';

  login() async {
    var url = Uri.parse('http://hqs-api:5000/api/login');
    print(username);
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      Navigator.of(context).push(_createRoute());
    } else if (response.statusCode == 403) {
      errorMessage('A senha não tá batendo ;-;',
          'Verifique sua senha e tente novamente.');
    } else if (response.statusCode == 404) {
      errorMessage('Tem certeza que já se cadastrou?',
          'Não encontramos esse usuário, verifique seus dados.');
    } else if (response.statusCode == 200) {
      print('Sucesso!');
    } else {
      print('Senhas não coincidem');
      errorMessage('Não conheço esse erro º-º', 'Tente novamente mais tarde.');
    }
  }

  errorMessage(title, description) {
    return (showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: 'Roboto-Black')),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                  width: mediaQuery.size.width * 0.20,
                  child: Image.asset('assets/images/miniLogo.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: 'Comfortaa'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: TextField(
                onChanged: (text) {
                  username = text;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'Nome de usuário',
                    filled: true,
                    fillColor: Colors.white),
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 20, right: 20, bottom: 15),
                child: TextField(
                  onChanged: (text) {
                    password = text;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: 'Senha',
                      filled: true,
                      fillColor: Colors.white),
                  style: TextStyle(fontSize: 18),
                )),
            Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.445,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: mediaQuery.size.width * 0.90,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 10),
                        child: Text("ENTRAR",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Roboto-Black')),
                      ),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.grey[300]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      width: mediaQuery.size.width * 0.90,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 10),
                          child: Text("VOLTAR",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Roboto-Black')),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(width: 2, color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
