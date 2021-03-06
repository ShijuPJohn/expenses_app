import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listOfTransactions;
  final Function deleteCallback;

  const TransactionList({Key key, this.listOfTransactions, this.deleteCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300.0,
      child: ListView.builder(
        itemCount: listOfTransactions.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 100.0,
                  child: Center(
                    child: Text(
                      '\$${listOfTransactions[index].amount.toStringAsFixed(2)}',
                      style: kPriceTextStyle.copyWith(
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  padding: EdgeInsets.all(10.0),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      border: Border.all(
                          width: 2.0,
                          color: Theme.of(context).primaryColor,
                          style: BorderStyle.solid)),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(listOfTransactions[index].title,
                          style: kTitleTextStyle),
                      Text(
                        DateFormat('E, MMM-d-y, h:m a')
                            .format(listOfTransactions[index].dateTime),
                        style: kDateTextStyle,
                      )
                    ],
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.red,
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteCallback(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
