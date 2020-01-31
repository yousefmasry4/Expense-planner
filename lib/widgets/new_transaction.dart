import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  int flag=0;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  void ok() {
    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
        selectedDate
    );
    Navigator.of(context).pop();
  }


  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        flag=1;
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          height: 500,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,

                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                // onChanged: (val) => amountInput = val,
                keyboardType: TextInputType.numberWithOptions(),
                onSubmitted: null,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: ()=>_selectDate(context),
                      child: flag == 0? Text("no date is selected",
                        style: TextStyle(color: Colors.red),
                      ):Text((selectedDate.toString()).split(" ")[0],
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: "f1",
                        fontWeight:FontWeight.w500,
                      ),)
                    ),
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                    onPressed: () {
                      // ignore: unnecessary_statements
                      titleController.text.isEmpty ||
                              double.parse(amountController.text) <= 0
                      || flag ==0
                          ? null
                          : ok();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
