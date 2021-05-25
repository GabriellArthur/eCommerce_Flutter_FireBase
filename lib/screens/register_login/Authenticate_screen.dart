import 'package:flutter/material.dart';
import 'package:calisthenics/screens/enderecos/screens.dart';

class Authenticate extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey[700],
                Colors.grey[900],
                Colors.grey[900],
                Colors.grey[900],
                Colors.grey[900],
                Colors.grey[900],
                Colors.grey[900]
              ]),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 400,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    child: Text(
                      'INSCREVA-SE GRÁTIS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    child: Text(
                      'ENTRAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
