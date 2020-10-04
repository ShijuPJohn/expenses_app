import 'package:expense_app/widgets/add_transaction_card.dart';
import 'package:expense_app/widgets/chart.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: 'QuickSand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0)))
          // accentColor: Colors.lightBlueAccent,
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> listOfTransactions = [];

  List<Transaction> get _recentTransactions {
    return listOfTransactions.where((element) {
      return element.dateTime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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
        title: Text(
          'Flutter App',
          style: TextStyle(),
        ),
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
            child: Chart(recentTransactions: _recentTransactions),
          ),
          Expanded(
            flex: 4,
            child: listOfTransactions.length > 0
                ? TransactionList(
                    listOfTransactions: listOfTransactions,
                  )
                : Center(
                    child: Image.asset(
                    'assets/images/sad_face.png',
                    height: 150,
                  )),
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
