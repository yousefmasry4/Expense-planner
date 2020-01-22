import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionList extends StatelessWidget{
  final List<Transaction> UserTransaction;

  TransactionList({ this.UserTransaction}) ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
          children:UserTransaction.map((tx) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      '\$'+tx.amount.toString(),
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.green,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title,
                        style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(169, 169, 169, 80)),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList()
      ),
    );
  }

}
