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
        Container(
            height: 15.0,
            child: FittedBox(
                child: Text('\$${amountForTheDay.toStringAsFixed(0)}'))),
        SizedBox(height: 4.0),
        Container(
          height: 50.0,
          width: 15.0,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              FractionallySizedBox(
                heightFactor:
                    totalAmount == 0 ? 0 : (amountForTheDay / totalAmount),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4.0),
        Text(weekDay),
      ],
    );
  }
}
