import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> listOfTransactions = [
    Transaction('t1', 'New shoes', 99.99, DateTime.now()),
    Transaction('t2', 'Grocery', 18.50, DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              child: Card(
                color: Colors.teal.shade100,
                child: Text('Chart'),
              ),
            ),
            Container(
                child: Column(
              children: listOfTransactions
                  .map(
                    (e) => Card(
                      child: Row(
                        children: <Widget>[
                          Container(child: Text(e.amount.toString()),
                          padding: EdgeInsets.all(10.0),),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(e.title),
                                Text(e.dateTime.year.toString())
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ))
          ],
        ));
  }
}
