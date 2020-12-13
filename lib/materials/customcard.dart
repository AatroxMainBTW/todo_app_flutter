import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  Function fc;
  String name;
  String content;
  String label;
  Color co;
  CustomCard({this.name,this.content,this.label,this.fc,this.co});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(

        onTap: fc,
        child: Wrap(
          children: <Widget>[
            Material(
              color: Colors.grey[850],
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text("$name",style: TextStyle(
                                color:  Colors.amberAccent[100],fontSize: 15,fontWeight: FontWeight.bold
                            ),
                            ),

                          ),

                          Row(
                            children: <Widget>[

                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Text("$content",style: TextStyle(
                                    fontSize: 13,color: Colors.grey[400]
                                ),),
                              ),

                            ],

                          ),

                          Container(

                            padding: EdgeInsets.all(10.0),
                            child: Text("$label",style: TextStyle(
                                fontSize: 13,color: co,fontWeight: FontWeight.bold
                            ),),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
