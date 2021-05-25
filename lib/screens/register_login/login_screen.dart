import 'package:calisthenics/controllers/AuthenticationService.dart';
import 'package:calisthenics/screens/register_login/findPassword.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthenticationService _auth = AuthenticationService();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.grey[400],
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(),
        child: ListView(
          children: <Widget>[
            Text(
              'E-mail ou nome de usuário',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.grey[400],
              ),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Senha',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.grey[400],
              ),
              child: new TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  _auth.signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FindPasswordScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
