import 'package:flutter/material.dart';
import 'package:rksi_bloc/data/impl/processors/date_processor_impl.dart';
import 'package:rksi_bloc/resources/color/color.dart';

class DateItem extends StatelessWidget {
  final DateTime date;

  const DateItem({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final day = DateProcessorImpl().getDate(date);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: primary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            day,
            style: const TextStyle(
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}
