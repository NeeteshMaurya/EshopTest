import 'package:ecom/screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ecom/screen/homepage.dart';
import 'package:ecom/screen/welcome_page.dart';
import 'screen/sign_up.dart';


void main() async{
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
      ),
      home: StreamBuilder(
        //it checks if user is already login then redirect to home page.
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (index,snapshot){
          if(snapshot.hasData){
            return HomePage();
          }
          return LoginPage();
        }),
    );
  }
}
