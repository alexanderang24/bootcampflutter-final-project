import 'package:cryptotracker/pages/Login.dart';
import 'package:cryptotracker/pages/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Dashboard(),
      // initialRoute: '/',
      // routes: <String, WidgetBuilder>{
      //   '/': (context) => LoginScreen(),
      //   '/main': (context) => MainApp(),
      // },
    );
  }
}
