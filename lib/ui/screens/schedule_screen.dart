import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rksi_bloc/bloc/repository/repository_bloc.dart';
import 'package:rksi_bloc/ui/screens/repository_ui.dart';
import 'package:rksi_bloc/ui/screens/search/search_action.dart';

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
          body: const RepositoryUI(),
        );
      }),
    );
  }
}
