import 'package:flutter/material.dart';
import 'package:sheria_legal/services/auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> passkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Form(
          key: passkey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Email format is invalid';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email e.g code@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    if (passkey.currentState.validate()) {
                      AuthService().resetPass(emailController.text);
                    }
                  },
                  child: Text('Submit'.toUpperCase()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
