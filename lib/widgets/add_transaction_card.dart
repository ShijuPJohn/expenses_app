import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

var _controllerTitle = TextEditingController();
var _controllerPrice = TextEditingController();

class AddTransactionCard extends StatefulWidget {
  final List<Transaction> listOfTransactions;
  final Function addFunction;

  AddTransactionCard({this.listOfTransactions, this.addFunction});

  @override
  _AddTransactionCardState createState() => _AddTransactionCardState();
}

class _AddTransactionCardState extends State<AddTransactionCard> {
  DateTime dateTime = DateTime.now();

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
    widget
        .addFunction(Transaction('t3', enteredTitle, enteredAmount, dateTime));
    _controllerPrice.clear();
    _controllerTitle.clear();
  }

  void _presentDatePicker(BuildContext ctx) {
    showDatePicker(
            context: ctx,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        dateTime = value;
      });
    });
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
                decoration: kInputDecorationFunction(context, 'Title'),
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
                decoration: kInputDecorationFunction(context, 'Price'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat('yyyy-MM-dd').format(dateTime)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        _presentDatePicker(context);
                      },
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Pick Date',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                addTransaction();
                Navigator.pop(context);
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
