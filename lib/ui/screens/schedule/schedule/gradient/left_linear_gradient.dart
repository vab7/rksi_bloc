import 'package:flutter/material.dart';
import 'package:rksi_bloc/resources/constants/constants.dart';

class LeftLinearGradient extends StatelessWidget {
  final Color color;

  const LeftLinearGradient({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      bottom: 0,
      child: Stack(
        children: [
          Container(
            width: 6,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(radius + 1),
                bottomLeft: Radius.circular(radius + 1),
              ),
            ),
          ),
          Container(
            width: 6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
