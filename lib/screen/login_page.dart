import 'package:ecom/widget/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

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
                    controller: null,
                    obscureText: false,
                    hintText: "Username",
                    //icon: Icons.person
                  ),
                  SizedBox(height: 20,),
                  MyTextField(
                    controller: null,
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
                  onPressed: (){},
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
