import 'package:flutter/material.dart';

const kPriceTextStyle = TextStyle(
    color: Colors.purple, fontSize: 20.0, fontWeight: FontWeight.w600);
const kDateTextStyle = TextStyle(
    fontSize: 13.0, fontWeight: FontWeight.w400, color: Colors.blueGrey);
const kTitleTextStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: Colors.lightBlue);

InputDecoration kInputDecorationFunction (BuildContext ctx, String label){
  return InputDecoration(
    labelText: label,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(ctx).primaryColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(ctx).primaryColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );
}