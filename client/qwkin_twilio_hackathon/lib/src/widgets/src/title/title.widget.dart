import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  final String text;
  final Color? color;

  const Title(
    this.text, {
    Key? key,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 21,
        color: color,
      ),
    );
  }
}
