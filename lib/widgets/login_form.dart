import 'package:battle_chess/pages/profile.dart';
import 'package:battle_chess/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validForm() async {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40, top: 32, bottom: 8),
          child: TextField(
            controller: loginController,
            style: TextStyle(fontSize: 18),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              hintText: 'Login',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
            top: 8,
            bottom: 8,
          ),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(fontSize: 18),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Password',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.only(right: 16),
            margin: EdgeInsets.all(16),
            child: Consumer(builder: (context, ref, _) {
              return IconButton(
                onPressed: () async {
                  final api = ref.read(apiProvider);
                  await api.auth(loginController.text, passwordController.text);

                  if (api.token != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  } else {
                    AlertDialog(title: Text('gh'));
                  }
                },
                icon: Icon(Icons.arrow_forward),
              );
            }),
          ),
        ),
      ],
    );
  }
}
