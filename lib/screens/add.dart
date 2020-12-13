import 'package:flutter/material.dart';
import 'package:todo_app_flutter/dbservices/dboperation.dart';

class Add extends StatelessWidget {
  final _Tasktxt = TextEditingController();
  final _Contenttxt = TextEditingController();
  String _Labletxt ;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,

        appBar: AppBar(
          title: Text("Add Task"),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0.0,

        ),
        body: Scaffold(
          resizeToAvoidBottomPadding: false,

          backgroundColor: Colors.grey[900],
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(

              decoration: BoxDecoration(

                  color: Colors.grey[800],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))),

              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                    Form(
                      key:_formkey ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Task",style: TextStyle(
                              color:  Colors.amberAccent[100],
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your task',
                            ),
                            controller:_Tasktxt,
                            validator: (val) =>
                            val.isEmpty ? 'Task name cant be empty and label' : null,
                          ),
                          SizedBox(height: 15,),
                          Text("Description",style: TextStyle(
                              color:  Colors.amberAccent[100],
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your Description',
                            ),
                            controller:_Contenttxt,
                            validator: (val) =>
                            val.isEmpty ? 'Content cant be empty label' : null,

                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Label",style: TextStyle(
                        color:  Colors.amberAccent[100],
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        LabelButton("Easy",Colors.greenAccent,(){
                          _Labletxt="Easy";
                          print(_Labletxt);
                          print(_Tasktxt);
                          print(_Contenttxt);

                        }),
                        SizedBox(width: 5,),
                        LabelButton("Moderate",Colors.orange,(){
                          _Labletxt="Moderate";
                          print(_Labletxt);
                          print(_Tasktxt);
                          print(_Contenttxt);
                        }),
                        SizedBox(width: 5,),
                        LabelButton("Urgent",Colors.red,(){
                          _Labletxt="Urgent";
                          print(_Labletxt);
                          print(_Tasktxt.text);
                          print(_Contenttxt.text);

                        }),
                      ],
                    ),
                    SizedBox(height: 170,),
                    Row(
                        children: <Widget>[
                          ButtonCV("Validate",Icons.verified_outlined,Colors.green,() async {

                            if(_Tasktxt.text.isEmpty || _Contenttxt.text.isEmpty || _Labletxt.isEmpty){
                                    _Tasktxt.text = "label and name task cannot be empty";
                                    _Contenttxt.text = "label and content cannot be empty";

                            } else{
                              int i = await DatabaseHelper.instance.insert({
                                DatabaseHelper.columnName : _Tasktxt.text,
                                DatabaseHelper.columnContent: _Contenttxt.text,
                                DatabaseHelper.columnLabel : _Labletxt

                              });
                              Navigator.pushReplacementNamed(context, '/home',arguments: {
                                'labelname' : _Labletxt,
                              }

                              );
                              print('the inserted id is $i');
                            }


                          }),
                          SizedBox(width: 5,),
                          ButtonCV("Cancel",Icons.cancel_outlined,Colors.redAccent,() {
                              Navigator.pushReplacementNamed(context,'/home');
                          }),
                        ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget LabelButton(String name, Color color, Function fc){
  return MaterialButton(
      onPressed: fc,
      color: color,
      splashColor: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: <Widget>[
          Text(name,style: TextStyle(
              color: Colors.white,
          ),)
        ],
      )
  );
}

Widget ButtonCV(String name, IconData icon,Color c,Function fc){
  return MaterialButton(
      onPressed: fc,
      color: c,
      splashColor: Colors.grey[200],
      minWidth: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: <Widget>[
          Icon(icon,color: Colors.white,),
          SizedBox(width: 10,),
          Text(name,style: TextStyle(
              color: Colors.white
          ),)
        ],
      )
  );
}