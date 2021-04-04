import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.orange[900],
          elevation: 0,
          leading: Icon(Icons.sort),
          title: Text("Foodigo"),
          actions: [
            CircleAvatar(
              //backgroundColor: Colors.blue[900],
              //backgroundImage: AssetImage('assets/profile.png'),
            ),
          ],
        ),
      ),
    );
  }
}
