import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/functions.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function del;
  TransactionList(this.transactions,this.del);


  @override
  Widget build(BuildContext context) {
    return Column(
      children:
         transactions.map((d){
         return Card(
            child: Row(
              children: <Widget>[

                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${funcs.amounting(d.amount)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                ),
                Expanded(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      d.title,
                      style: Theme.of(context).textTheme.title
                    ),
                    Text(
                      DateFormat.yMMMd().format(d.date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                ),
           IconButton(
           icon: Icon(
           Icons.delete,
           color: Colors.red,
           ),
             onPressed: ()=>del(d),
           )
           ],
            ),
          );
        }).toList(),


    );
  }
}
