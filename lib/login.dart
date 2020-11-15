import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/animation.dart';
import 'package:startup_try_2/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _auth = FirebaseAuth.instance;

  String email,password;
  Widget _buildEmail(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            email=value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email,color: Colors.blue,),
            labelText: "E-mail"
        ),
      ),
    );
  }
  Widget _buildPassword(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value){
          setState(() {
            password=value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline,color: Colors.blue,),
            labelText: "Password"
        ),
      ),
    );
  }
  Widget _buildForgotPswd(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          onPressed: (){},
          child: Text("Forgot Password?"),
        ),
      ],
    );
  }
  Widget _buildLoginBtn(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4*(MediaQuery.of(context).size.height/25),
          width: 6*(MediaQuery.of(context).size.width/15),
          child: RaisedButton(
            onPressed: (){
              try{
              final user = _auth.signInWithEmailAndPassword(email: email, password: password);
              print(user);
              if(user != null){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage()));
              }}
              catch(e){
                print(e);
              }

            },
            elevation: 5.0,
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            child: Text("Login",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.1,
                fontSize: MediaQuery.of(context).size.height/43,
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildLogin(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200,
        horizontal: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            child: FadeAnimation(2, Container(
              height: MediaQuery.of(context).size.height*0.55,
              width: MediaQuery.of(context).size.width*0.8,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Login",style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height/25,
                      ),
                      ),
                    ],
                  ),
                  _buildEmail(),
                  _buildPassword(),
                  _buildForgotPswd(),
                  SizedBox(height: 20,),
                  _buildLoginBtn(),
                ],
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              FadeAnimation(1.2, Container(
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.lightBlue, Colors.blue, Colors.indigo,]
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(50),
                        bottomRight: const Radius.circular(50),
                      )
                  ),
                ),
              ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogin(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}