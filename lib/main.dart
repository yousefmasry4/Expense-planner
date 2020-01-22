import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
@override
  Widget build(BuildContext context) {
  var questions=["what's your favorite color? ",
                  "what's your favorite animal"];
  // TODO: implement build
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text("hello world"),),
      body: Column(
        children: <Widget>[
          Text(questions[0]),
          RaisedButton(child:Text("yellow"),onPressed: null,),
          RaisedButton(child:Text("blue"),onPressed: null,),
          RaisedButton(child:Text("red"),onPressed: null,),
          RaisedButton(child:Text("black"),onPressed: null,),

        ],
      ),
    ));
  }

}