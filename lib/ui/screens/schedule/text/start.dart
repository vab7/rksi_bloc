import 'package:flutter/material.dart';
import 'package:rksi_bloc/resources/constants/constants.dart';

class Start extends StatelessWidget {
  final String start;
  final String end;
  final Color color;

  const Start({
    Key? key,
    required this.start,
    required this.end,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$start - $end',
          style: TextStyle(color: color, fontSize: fontSize),
        ),
      ],
    );
  }
}
