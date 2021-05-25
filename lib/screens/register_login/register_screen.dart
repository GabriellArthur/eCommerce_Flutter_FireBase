import 'package:calisthenics/controllers/AuthenticationService.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthenticationService _auth = AuthenticationService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController spc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.grey[400],
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(),
          child: ListView(
            children: <Widget>[
              Text(
                'E-mail',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'exemple@gmail.com',
                    border: InputBorder.none,
                  ),
                  validator: (String emailController) {
                    return emailController.contains('@')
                        ? null
                        : 'Insira um email';
                  },
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Senha',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 5,
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
                    icon: Icon(Icons.lock),
                    hintText: '123456',
                    border: InputBorder.none,
                  ),
                  validator: (String passwordController) {
                    return passwordController.length < 6
                        ? 'Insira mais de 6 caracteres'
                        : null;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Confirmar Senha',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
                child: TextFormField(
                  controller: spc,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: '123456',
                    border: InputBorder.none,
                  ),
                  validator: (String passwordController) {
                    if (passwordController.length > 6) {
                      if (identical(
                          passwordController.trim(), spc.text.trim())) {
                        return null;
                      } else {
                        return 'Senhas diferentes';
                      }
                    } else {
                      return 'Insira mais de 6 caracteres';
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30,
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
                    'Registrar-se',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _auth.signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
