

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeNew extends StatelessWidget {
  final Function addone;
  final titlecontoller =TextEditingController();
  final amountcontroller=TextEditingController();
  MakeNew({this.addone});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(decoration: InputDecoration(
              labelText:"Title",
            ),
              // onChanged:(value)=>title=value ,
              controller: titlecontoller,
            ),
            TextField(decoration: InputDecoration(
              labelText:"Amount",
            ),
              // onChanged:(value)=>amount=value ,
              controller: amountcontroller,
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.green,
              onPressed: (){
                  addone(
                    this.titlecontoller.text,
                      double.parse(this.amountcontroller.text)
                  );
              },
            )
          ],
        )
    );
  }
}