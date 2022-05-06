import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  final String sub;

  const Subject({Key? key, required this.sub}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sub,
      style: const TextStyle(
        fontSize: 22,
        height: 1,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
