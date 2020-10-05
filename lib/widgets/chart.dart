import 'package:expense_app/models/chart_data.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({this.recentTransactions});

  List<ChartData> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].dateTime.day == weekDay.day &&
            recentTransactions[i].dateTime.month == weekDay.month &&
            recentTransactions[i].dateTime.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return ChartData(
          DateFormat.E().format(weekDay).substring(0, 2), totalSum);
    });
  }

  double get totalAmountForTheWeek {
    double totalAmount = 0.0;
    for (Transaction c in recentTransactions) {
      totalAmount += c.amount;
    }
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    for (ChartData i in groupedTransactionValues) {
      print('day : ${i.day} & amount : ${i.amount}');
    }
    return Card(
      elevation: 6.0,
      margin: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.reversed.map((e) {
          return Flexible(
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: ChartBar(
                weekDay: e.day,
                amountForTheDay: e.amount,
                totalAmount: totalAmountForTheWeek,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
