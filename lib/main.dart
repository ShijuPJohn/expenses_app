import 'package:expense_app/widgets/add_transaction_card.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> listOfTransactions = [];

  void addToListOfTransactions(Transaction tx) {
    setState(() {
      listOfTransactions.add(tx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return AddTransactionCard(
            listOfTransactions: listOfTransactions,
            addFunction: addToListOfTransactions,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              startAddNewTransaction(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text('This is the area for chart'),
          ),
          Expanded(
            flex: 4,
            child: TransactionList(
              listOfTransactions: listOfTransactions,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
