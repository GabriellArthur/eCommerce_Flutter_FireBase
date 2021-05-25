import 'package:calisthenics/controllers/AuthenticationService.dart';
import 'package:calisthenics/controllers/app_controller.dart';
import 'package:calisthenics/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final AuthenticationService _auth = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.green,
          title: Text(
            'Settings',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.nights_stay_outlined,
              iconSize: 30.0,
              onPressed: () => AppController.instance.changeTheme(),
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.all(5),
          sliver: SliverToBoxAdapter(
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                _auth.signOut();
              },
              child: Text("Sign out"),
            ),
          ),
        ),
      ],
    );
  }
}
