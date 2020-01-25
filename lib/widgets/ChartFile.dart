

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/barWidget.dart';


class chart extends StatelessWidget{
  double max;
  List<Map<String, Object>> mylist;
  chart({this.mylist,this.max});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: mylist.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: bar(
              day:data['day'],
              amount:data['amount'],
              barvalue:max,
            ),
          );
        }).toList(),
      ),
    );
  }
}

