import 'package:flutter/material.dart';
import 'package:todo_app_flutter/dbservices/dboperation.dart';
import 'package:todo_app_flutter/materials/customcard.dart';
import 'package:todo_app_flutter/materials/customlisttile.dart';
import 'package:todo_app_flutter/materials/loading.dart';
import 'package:todo_app_flutter/materials/modbutton.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  String nowdate;
  String nowtime;
  bool validation = true;
  List<Map<String,dynamic>> queryrow = [];
  String date;
  String time;
  void remove(int i) async{
    String rowin = await DatabaseHelper.instance.delete(queryrow[i]['name']);
    print(rowin);
  }
  void dates() async {
    final DateTime now = DateTime.now();
   // print(now);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    time =DateFormat.jms().format(now); // print time
    date = DateFormat.yMMMMEEEEd().format(now);
  }
  void db() async{
    queryrow = await DatabaseHelper.instance.queryAll();
    print("query is");
    print(queryrow);
    print(queryrow.length);
    gg= true;

}
bool gg = false;
Color easy = Colors.greenAccent;
Color moderate = Colors.orangeAccent;
Color urgent = Colors.red;
Color current ;
@override
  void initState() {
  dates();
  db();

    print(date);
    if(queryrow.isEmpty){
      validation = false;
    }else{
      validation = true;
    }
    updatelist();
    updatetime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

      data = ModalRoute.of(context).settings.arguments;

    return gg?SafeArea(

      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor:Colors.grey[900],
        appBar: AppBar(
          title: Text("DoCheck",style: TextStyle(
            fontFamily: "Trajan Pro",
            letterSpacing: 1.0
          ),),
          centerTitle: true,
          backgroundColor:  Colors.grey[850],
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
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/tenor.gif"),
                        radius: 40,
                      ),
                      SizedBox(height: 20,),
                      Text("Welcome !",style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 1.0,
                        color: Colors.amberAccent[100],
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),

              ),
              Divider(
                height: 1.0,
                color: Colors.grey[400],
              ),
          Expanded(
            flex: 2,
            child: Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(date,style: TextStyle(
                        color:Colors.amberAccent[400],fontSize: 13
                      ),),
                      Text(time,style: TextStyle(
                          color:Colors.amberAccent,fontWeight: FontWeight.bold,fontSize: 13)),

                    ],
                  ),
                  ModifiedButton(() async {
                    Navigator.pushReplacementNamed(context, '/add');
                  })
                ],

              ),
            ),
          ),
              Divider(
                height: 1.0,
                color: Colors.grey[400],
              ),
              Expanded(
                flex: 6,
                child: Container(

                  child: ListView.builder(
                    itemCount: queryrow.length,
                    itemExtent: 120.0,

                    itemBuilder:(BuildContext context,int index){
                      if(queryrow[index]['label'] == 'Easy'){
                        current = easy;
                      }else if(queryrow[index]['label'] == 'Moderate'){
                        current = moderate;

                      }else if(queryrow[index]['label'] == 'Urgent'){
                        current = urgent;

                      }

                      return validation ?Text("Add some tasks"):CustomCard(name: queryrow[index]['name'],content: queryrow[index]['content'],label: queryrow[index]['label'],fc: ()async{
                        //String rowin = await DatabaseHelper.instance.delete(queryrow[index]['name']);
                        //print(rowin);
                        dialog(context,index);
                      },co: current,);
                    },

                  ),

                ),
              ),
            ],
          ),
        )
      ),
    ):Loading();

  }

  void updatelist() async{
    List<Map<String,dynamic>> tod = await DatabaseHelper.instance.queryAll();
    setState(() {
        this.queryrow = tod;
    });
  }

  void updatetime(){
    final DateTime now = DateTime.now();
    String time2 =DateFormat.jms().format(now); // print time
  String date2 = DateFormat.yMMMMEEEEd().format(now);
  setState(() {
    this.time = time2;
    this.date = date2;
  });
  }

Future<void> dialog(context,int i){
  return showDialog<void>(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('Alert !!!'),
        content: Text('Do u want to erase this task'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()async {
              String rowin = await DatabaseHelper.instance.delete(queryrow[i]['name']);
              print(rowin);
              Navigator.of(dialogContext).pushReplacementNamed('/home'); // Dismiss alert dialog
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(dialogContext).pushReplacementNamed('/home');// Dismiss alert dialog
            },
          ),
        ],
      );
    },
  );
}


}
