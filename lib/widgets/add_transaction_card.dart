import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

var _controllerTitle = TextEditingController();
var _controllerPrice = TextEditingController();

class AddTransactionCard extends StatelessWidget {
  final List<Transaction> listOfTransactions;
  final Function addFunction;

  AddTransactionCard({this.listOfTransactions, this.addFunction});

  void addTransaction() {
    double enteredAmount;
    final enteredTitle = _controllerTitle.text;
    try {
      enteredAmount = double.parse(_controllerPrice.text);
    } on Exception catch (e) {
      return;
    }
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addFunction(Transaction('t3', enteredTitle, enteredAmount, DateTime.now()));
    _controllerPrice.clear();
    _controllerTitle.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerTitle,
                // onChanged: (value) {
                //   titleValue = value;
                // },
                decoration: kInputDecorationFunction(context,'Title'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _controllerPrice,
                onSubmitted: (value) {
                  addTransaction();
                  Navigator.pop(context);
                },
                // onChanged: (value) {
                //   priceValue = double.parse(value);
                // },
                decoration: kInputDecorationFunction(context,'Price'),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                addTransaction();
                Navigator.pop(context);
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
