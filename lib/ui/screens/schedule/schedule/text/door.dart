import 'package:flutter/material.dart';
import 'package:rksi_bloc/resources/widgets/style/text_style.dart';

class Door extends StatelessWidget {
  final String door;

  const Door({Key? key, required this.door}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Text(
        'Кабинет $door',
        style: itemTextStyle,
      ),
    );
  }
}
