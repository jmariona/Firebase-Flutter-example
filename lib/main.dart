import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



void main()=> runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.amberAccent,
      accentColor: Colors.tealAccent

    ),
  )
);


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String name, description;
  double price;


  getName(name){
    this.name = name;
      print(name);
  }

  getDescription(description){
      this.description = description;
        print(description);
  }


  getPrice(price){
    this.price = double.parse(price);
      print(price);
  }


  createData(){


  }

  updateData(){

  }

  deleteData(){

  }

  readData(){
    DocumentReference documentReference = Firestore.instance.collection("Product").document("NmjtsimUgydbsV00Vqf9");

    documentReference.get().then((datasnapshot){
          print(datasnapshot.data["name"]);
          print(datasnapshot.data["description"]);
          print(datasnapshot.data["price"]);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Crud App"),

      ),
      body: Padding(
        padding:  EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Name"
                ),
                onChanged: (String name){
                    getName(name);
                }
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Description"
                ),
                onChanged: (String description){
                  getDescription(description);
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Price"
                ),
                onChanged: (String price){
                  getPrice(price);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Row(
                textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(1.0),
                      child: RaisedButton(
                        onPressed: (){
                          createData();
                        },
                        color: Colors.greenAccent,
                        child: Text("Create"),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(1.0),
                      child: RaisedButton(
                        onPressed: (){
                          updateData();
                        },
                        color: Colors.amberAccent,
                        child: Text("Update"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: RaisedButton(
                        onPressed: (){
                          deleteData();
                        },
                        color: Colors.redAccent,
                        child: Text("Delete"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: RaisedButton(
                        onPressed: (){
                          readData();
                        },
                        color: Colors.cyan,
                        child: Text("Read"),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
