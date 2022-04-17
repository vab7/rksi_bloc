import 'package:flutter/material.dart';
import 'package:rksi_bloc/resources/widgets/style/text_style.dart';

class Subject extends StatelessWidget {
  final String sub;

  const Subject({Key? key, required this.sub}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sub,
      style: subjectTextStyle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
