import 'package:flutter/material.dart';
import 'package:rksi_bloc/resources/widgets/style/text_style.dart';

class Group extends StatelessWidget {
  final String group;

  const Group({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Text(group, style: itemTextStyle),
    );
  }
}
