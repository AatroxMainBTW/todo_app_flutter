import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/materials/customlisttile.dart';
class GameRules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[850],
          appBar: AppBar(
            backgroundColor: Colors.grey[900],
            title: Text("DoCheck",style: TextStyle(fontFamily: "Trajan Pro",letterSpacing: 1.0),),
            centerTitle: true,
          ),drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.grey[850], //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawer(
            child: ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.grey[900]),
                  accountName: Row(
                    children: <Widget>[
                      Icon(Icons.supervised_user_circle_outlined,color: Colors.amberAccent[100],),
                      SizedBox(width: 5,),
                      new Text("Made By Fouzi Hammouda \"Dazai"""),
                    ],
                  ),
                  accountEmail: Row(
                    children: <Widget>[
                      Icon(Icons.email_outlined,color: Colors.amberAccent[100],),
                      SizedBox(width: 5,),
                      new Text("https://github.com/AatroxMainBTW")
                    ],
                  ),
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage: AssetImage("assets/tenor.gif"),
                  ),

                ),

                CustomListTile(Icons.home, 'Home', () => {
                  Navigator.pushReplacementNamed(context, '/home')
                }),
                CustomListTile(Icons.help_outline, 'Help', () => {
                  Navigator.pushReplacementNamed(context, '/gr')
                }),
              ],

            ),

          ),
        ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Rules :",style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Trajan Pro",
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 25,),
                Text("1- Tap add task to add a task...",style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Trajan Pro",
                    color: Colors.grey[100]
                ),),
                SizedBox(height: 15,),
                Text("2- Fulfill all the field ",style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Trajan Pro",
                    color: Colors.grey[100]
                ),),
                SizedBox(height: 15,),
                Text("3- you can delete a task by tapping on her ",style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Trajan Pro",
                    color: Colors.grey[100]
                ),),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/tenor.gif"),
                    )
                  ],
                )
              ],
            ),
          ),)
    );
  }}
