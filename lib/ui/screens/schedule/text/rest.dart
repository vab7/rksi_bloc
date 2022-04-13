import 'package:flutter/material.dart';
import 'package:rksi_bloc/resources/color/color.dart';
import 'package:rksi_bloc/resources/constants/constants.dart';

class Rest extends StatelessWidget {
  final String rest;

  const Rest({Key? key, required this.rest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 2,
      right: 0,
      child: Row(
        children: [
          Text(
            rest,
            style: const TextStyle(
              color: secondaryText,
              fontSize: fontSize,
            ),
          ),
          const SizedBox(width: 1),
          const Icon(
            Icons.schedule,
            size: fontSize,
            color: secondaryText,
          ),
        ],
      ),
    );
  }
}
