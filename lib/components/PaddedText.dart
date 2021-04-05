import 'package:flutter/material.dart';

class PaddedText extends StatelessWidget {
  final String text;

  PaddedText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
        child: Text(this.text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
        padding: EdgeInsets.only(top: 5, bottom: 5));
  }
}
