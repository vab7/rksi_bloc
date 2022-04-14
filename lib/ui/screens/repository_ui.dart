import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rksi_bloc/bloc/repository/repository_bloc.dart';
import 'package:rksi_bloc/resources/color/color.dart';
import 'package:rksi_bloc/resources/widgets/loading_widget.dart';
import 'package:rksi_bloc/resources/widgets/no_internet_widget.dart';
import 'package:rksi_bloc/ui/screens/date/date_list.dart';

class RepositoryUI extends StatelessWidget {
  const RepositoryUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: white,
      child: BlocBuilder<RepositoryBloc, RepositoryState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingWidget();
          }
          if (state is LoadedState) {
            return DateList(date: state.date);
          }
          return const NoInternetWidget();
        },
      ),
    );
  }
}
