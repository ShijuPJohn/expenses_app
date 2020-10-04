import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String weekDay;
  final double amountForTheDay;
  final double totalAmount;

  ChartBar({this.weekDay, this.amountForTheDay, this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(weekDay),
        Text('\$$amountForTheDay'),
        Text('$totalAmount')
      ],
    );
  }
}
