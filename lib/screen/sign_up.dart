import 'package:ecom/widget/text_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  void validation(){
    //validation for firstName
    if(firstName.text.trim().isEmpty||firstName.text.trim()==null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('Firstname is Empty.'),
        ),
      );
      return;
    }
    //validation for Last Name
    if(lastName.text.trim().isEmpty||lastName.text.trim()==null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('Lastname is Empty.'),
        ),
      );
      return;
    }
    //validation for Email
    if(email.text.trim().isEmpty||email.text.trim()==null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('Email is Empty.'),
        ),
      );
      return;
    }
    //validation for Password
    if(password.text.trim().isEmpty||password.text.trim()==null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('Password is Empty.'),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: globalKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange[900],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){},
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.orange[900],
                ),
              ),
              Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      controller: firstName,
                      obscureText: false,
                      hintText: "First Name",
                    ),
                    MyTextField(
                      controller: lastName,
                      obscureText: false,
                      hintText: "Last Name",
                    ),
                    MyTextField(
                      controller: email,
                      obscureText: false,
                      hintText: "Email",
                    ),
                    MyTextField(
                      controller: password,
                      hintText: "Password",
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                      child: Text("Cancel",style: TextStyle(fontSize: 20),),
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 45,),
                  Container(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                      child: Text("SignUp",style: TextStyle(fontSize: 20),),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
