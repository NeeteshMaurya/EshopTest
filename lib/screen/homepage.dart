import 'package:flutter/cupertino.dart';
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
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                backgroundColor: Colors.blue[900],
                backgroundImage: AssetImage('assets/profile.png'),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                children: [
                  SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryContainer(
                      image: "assets/pizza.png",
                      name: "All",
                    ),
                    CategoryContainer(
                      image: "assets/hotdog.png",
                      name: "HotDog",
                    ),
                    CategoryContainer(
                      image: "assets/burger.png",
                      name: "Burger",
                    ),
                    CategoryContainer(
                      image: "assets/cake.png",
                      name: "Cake",
                    ),
                    CategoryContainer(
                      image: "assets/pizza.png",
                      name: "All",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4,),
              Container(
                height: 460,
                    child: GridView.count(
                      shrinkWrap: false,
                        primary: false,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      children: [
                        BottomContainer(
                          image: "assets/cake.png",
                          name: "Cake",
                          price: 9,
                        ),
                        BottomContainer(
                          image: "assets/burger.png",
                          name: "Burger",
                          price: 6,
                        ),
                        BottomContainer(
                          image: "assets/hotdog.png",
                          name: "HotDog",
                          price: 3,
                        ),
                        BottomContainer(
                          image: "assets/pizza.png",
                          name: "Pizza",
                          price: 12,
                        ),
                      ],
                    ),
                  ),
            ]),
          ),
        ),
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  String image;
  int price;
  String name;

  BottomContainer({this.image,this.name,this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            
            radius: 50,
            backgroundImage: AssetImage(image,),
          ),
          ListTile(
            leading: Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: Text('\$ $price',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  String image;
  String name;

  CategoryContainer({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 10,
            top: 10,
          ),
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
