import 'package:flutter/material.dart';
import 'package:startup_try_2/authentication.dart';
import 'package:startup_try_2/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyApp()));}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FlatButton(
          onPressed: (){
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartPage()),
              );
            });
          },
          child: Text("Get Started"),
        ),
      ),
    );
  }
}
