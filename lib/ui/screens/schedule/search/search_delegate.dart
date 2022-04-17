import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rksi_bloc/bloc/search/search_bloc.dart';
import 'package:rksi_bloc/data/impl/repository/repository_impl.dart';
import 'package:rksi_bloc/resources/color/color.dart';
import 'package:rksi_bloc/resources/widgets/loading_widget.dart';
import 'package:rksi_bloc/resources/widgets/no_internet_widget.dart';

class SearchGroupsDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, ''),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositoryImpl<dynamic>(),
      child: BlocProvider(
        create: (context) => SearchBloc()..add(Initial()),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const LoadingWidget();
            }
            if (state is LoadedState) {
              final bloc = context.read<SearchBloc>();
              final names = bloc.getNames(query);
              return ListView.builder(
                itemCount: names.length,
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemBuilder: (context, index) {
                  final name = names[index].split('#');
                  bloc.getSuggestionsText(names[index], query);
                  return ListTile(
                    onTap: () => close(context, name[1]),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: RichText(
                        text: TextSpan(
                          text: bloc.queryText,
                          style: const TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: bloc.nameText,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is NoInternetState) {
              return const NoInternetWidget();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
