import 'package:cryptotracker/pages/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "Crypto Tracker",
                style: TextStyle(color: Color(0xff3853a2), fontWeight: FontWeight.w500, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Color(0xff3853a2),
                radius: 75,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/icon/logo.jpg"),
                  radius: 70,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Username"),
                )),
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Password"),
                )),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password",
                style: TextStyle(color: Color(0xff3853a2)),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    style: raisedButtonStyle,
                    child: Text("Register"),
                    onPressed: () async {
                      await _firebaseAuth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                    })),
            SizedBox(height: 10),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  child: Text("Login"),
                  onPressed: () async {
                    await _firebaseAuth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          ),
                        );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Color(0xff3853a2),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);
