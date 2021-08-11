import 'package:battle_chess/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: const Text('Battle Chess'),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16, top: 8, bottom: 16),
                  child: Text(
                    'Welcome to Battle Chess',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/img/chess1.png'),
                    height: 120,
                  ),
                ),
                LoginForm(),
                SizedBox(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.create),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Create an account',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
