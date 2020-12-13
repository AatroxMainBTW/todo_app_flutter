import 'package:flutter/material.dart';

class ModifiedButton extends StatelessWidget {
  Function fc;
  ModifiedButton(this.fc);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:fc,
      color:Colors.amberAccent[400],
      splashColor: Colors.amberAccent[100],
        minWidth: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: <Widget>[
          Icon(Icons.add,color: Colors.white,),
          SizedBox(width: 10,),
          Text("Add Task",style: TextStyle(
            color: Colors.white
          ),)
        ],
      )
    );
  }
}
