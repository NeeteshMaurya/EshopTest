import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {

  Widget button({String name,Color color,Function onPressed}) {
    return Container(
      width: 300,
      height: 45,
      child: ElevatedButton(
        child: Text(name,style: TextStyle(fontSize: 20),),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/welcome.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Text(
                  "Welcome to Foodigo",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.blue[900]),
                ),
                Column(
                  children: [
                    Text("Order food from our App and"),
                    Text("enjoy our service and food."),
                  ],
                ),
                button(
                  color: Colors.orange[500],
                  name: "Login",
                  onPressed: (){
                  },
                ),
                button(
                    color: Colors.blue[900],
                    name: "Sign Up",
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}




