import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/widgets/ChartFile.dart';
import 'package:untitled/widgets/new_transaction.dart';
import 'package:untitled/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',

      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        primarySwatch: Colors.brown,
        accentColor: Colors.amber,
        fontFamily: "f1",
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: "f1",
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        appBarTheme: AppBarTheme(
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: "f2",
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final titleController = TextEditingController();

  final amountController = TextEditingController();
  final List<Transaction> _userTransactions = [];

  List<Map<String,Object>> get  groupedTransactionValues{
      return List.generate(7, (index){
        double total=0;
        final weekday =DateTime.now().subtract(Duration(days: index),);
        _userTransactions.forEach((k){
          if (k.date.day == weekday.day && k.date.month == weekday.month&& k.date.year == weekday.year){
            total +=k.amount;
          }

        });
        return {"day":DateFormat.E().format(weekday),"amount":total};
      }
      );
  }
  void temptest(){
    List<Map<String, Object>> x=groupedTransactionValues;
    x.forEach((x){
       print(x.toString());
    });
  }
  double max=0;
  void mymax(){
    List<Map<String, Object>> myl=groupedTransactionValues;
    max=0;
    myl.forEach((x){
      print((x["amount"]).runtimeType);
      double val=x["amount"];
      setState(() {
        max=val > max ? val :max;
      });
    });
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
      temptest();
      mymax();
      print(max);

    });
  }

  

  void startnewone(BuildContext ctx){

    // ignore: missing_return
    showModalBottomSheet(context: ctx, builder: (_){
        return GestureDetector(
          onDoubleTap: (){},
          behavior: HitTestBehavior.opaque,
            child :NewTransaction(_addNewTransaction),
        );
    } );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense planner',style: Theme.of(context).appBarTheme.textTheme.title,),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.account_balance_wallet),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            chart(
              max: max,
              mylist: groupedTransactionValues,
            ),
            _userTransactions.isEmpty?
            Column(
             children: <Widget>[
               SizedBox(
                 height: 170,
               ),
               Text(
                 "NO Transactions Added Yet !",
                 style: Theme.of(context).textTheme.title,
               ),
               SizedBox(
                 height: 40,
               ),
                Container(
                  height: 150,
                  child:Image.asset("assets/img/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
             ],
            )
            :TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.add),
        onPressed: ()=>startnewone(context),
      ),
    );
  }
}
