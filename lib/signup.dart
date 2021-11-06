import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  String username = '';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                  width: mediaQuery.size.width * 0.20,
                  child: Image.asset('assets/images/miniLogo.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Cadastro",
                  style: TextStyle(fontSize: 40, color: Colors.white),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: TextField(
                  onChanged: (text) {
                    username = text;
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
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: TextField(
                  onChanged: (text) {
                    username = text;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: 'Confirme a senha',
                      filled: true,
                      fillColor: Colors.white),
                  style: TextStyle(fontSize: 18),
                )),
            Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.35,
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
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 10),
                        child: Text("CADASTRAR",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
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
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 10),
                          child: Text("VOLTAR",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(width: 2, color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Text(
                        "Ao se cadastrar, você concorda com nossos Termos de Serviço e nossa Política de Privacidade."),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
