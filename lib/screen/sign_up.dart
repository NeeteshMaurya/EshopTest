import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecom/widget/text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern  = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  UserCredential userCredential;

  RegExp regExp = RegExp(SignUp.pattern);
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async{
    try {
      //Creating user in firebase Auth with email password
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
      );
      //Saving User data
      await FirebaseFirestore.instance.collection('UserData').doc(userCredential.user.uid).set({
        'firstName':firstName.text,
        'LastName': lastName.text,
        'Email':email.text,
        'Password':password.text,
        'UserId':userCredential.user.uid,//storing user id
      });
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('Password is too weak'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('The account already exists for that email.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text("Something went wrong"),
        ),
      );
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }


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
    else if(!regExp.hasMatch(email.text)){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('Please enter a valid Email.'),
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
    else{
      setState(() {
        loading = true;
      });
      sendData();
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
              loading?
              CircularProgressIndicator():Row(
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
