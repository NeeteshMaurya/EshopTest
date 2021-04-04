import 'package:ecom/widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static Pattern pattern  = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RegExp regExp = RegExp(LoginPage.pattern);
  UserCredential userCredential;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future loginAuth()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('Wrong Credential !!.'),
          ),
        );
      }
    }
  }

  void validation() {
    //validation for firstName
    if (email.text
        .trim()
        .isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('Email is Empty.'),
        ),
      );
      return;
    }
    else if(!regExp.hasMatch(email.text)){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('Please enter a valid Email.'),
        ),
      );
      return;
    }
    //validation for Last Name
    if (password.text
        .trim()
        .isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('Password is Empty.'),
        ),
      );
      return;
    }
    else{
      loginAuth();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){},
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Log In",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  MyTextField(
                    controller: email,
                    obscureText: false,
                    hintText: "Email",
                    //icon: Icons.person
                  ),
                  SizedBox(height: 20,),
                  MyTextField(
                    controller: password,
                    obscureText: true,
                    hintText: "Password",
                    //icon: Icons.lock,
                  ),
                ],
              ),
              Container(
                width: 300,
                height: 55,
                child: ElevatedButton(
                  child: Text("Login",style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    validation();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New User ?",style: TextStyle(color: Colors.blue[900]),),
                  Text(" Register now",style: TextStyle(color: Colors.red),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
