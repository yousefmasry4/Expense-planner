

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/functions.dart';
class bar extends StatelessWidget{
  double amount;
  double barvalue;
  String day;
  bar({this.amount,this.day,this.barvalue}){
    print("barvalue $barvalue");
    print(amount);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
          child: Container(
            height: 100,
            width: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    height: barvalue ==0?0:(amount/barvalue)*100,
                    color: Colors.green,
                  ),
              ],
            ),

          ),
        ),
        Text(day),
        Text("${funcs.amounting(amount)}\$"),
        SizedBox(
          height: 3,
          width: 70,
          child: Container(
            color: Colors.grey,
          ),
        )
      ],
    );
  }

}