import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rksi_bloc/bloc/repository/repository_bloc.dart';
import 'package:rksi_bloc/resources/color/color.dart';
import 'package:rksi_bloc/resources/widgets/loading_widget.dart';
import 'package:rksi_bloc/resources/widgets/no_internet_widget.dart';
import 'package:rksi_bloc/ui/screens/search/search_action.dart';

import 'widgets/lists/date_list.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoryBloc()..add(InitialEvent()),
      child: Builder(builder: (context) {
        final bloc = context.watch<RepositoryBloc>();
        return Scaffold(
          appBar: AppBar(
            title: Text(bloc.title ?? 'Группа'),
            centerTitle: true,
            actions: const [SearchAction()],
          ),
          body: ColoredBox(
            color: white,
            child: BlocBuilder<RepositoryBloc, RepositoryState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return loadingWidget();
                }
                if (state is LoadedState) {
                  return DateList(date: state.date);
                }
                return noInternetWidget();
              },
            ),
          ),
        );
      }),
    );
  }
}
