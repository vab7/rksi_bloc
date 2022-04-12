import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rksi_bloc/bloc/repository/repository_bloc.dart';
import 'package:rksi_bloc/ui/screens/search/search_delegate.dart';

class SearchAction extends StatelessWidget {
  const SearchAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () async {
        final result = await showSearch(
          context: context,
          delegate: SearchGroupsDelegate(),
        );

        final connectivity = await Connectivity().checkConnectivity();

        if (result != null && result.isNotEmpty) {
          if (connectivity != ConnectivityResult.none) {
            context.read<RepositoryBloc>().add(LoadFromApiEvent(result));
          }
        }
      },
    );
  }
}
