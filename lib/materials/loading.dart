import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app_flutter/dbservices/datetimeAPI.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  /*void setuptime() async{
    DatetimeAPI datetimeAPI = DatetimeAPI();
    await datetimeAPI.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time' : datetimeAPI.time,
      'date': datetimeAPI.date
    });
  }*/
  @override
  void initState(){
    super.initState();
    //setuptime();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("DoCheck",style: TextStyle(
                fontSize: 50,
                fontFamily: "pinky",
                color: Colors.amberAccent[100]
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
