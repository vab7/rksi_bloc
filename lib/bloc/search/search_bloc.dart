import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:rksi_bloc/bloc/repository/repository_bloc.dart';
import 'package:rksi_bloc/data/impl/repository/connectivity_impl.dart';
import 'package:rksi_bloc/data/impl/repository/repository_impl.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late List<String> _names;

  String? queryText;
  String? nameText;

  SearchBloc() : super(LoadingState()) {
    on<Initial>(
      (event, emit) async {
        final connectivity = await Connectivity().checkConnectivity();
        if (connectivity == ConnectivityResult.none) {
          add(NoInternet());

          ConnectivityImpl().connectivityStream.stream.listen(
            (event) {
              if (event != ConnectivityResult.none) {
                add(LoadGroups());
              }
            },
          );
        } else {
          add(LoadGroups());
        }
      },
    );

    on<LoadGroups>(
      (event, emit) async {
        emit(LoadingState());

        var i = 0;
        var str = 'group';

        final group =
            await RepositoryImpl<dynamic>().getRepository(type: '=groups');
        final teacher =
            await RepositoryImpl<dynamic>().getRepository(type: '=teachers');

        final groupLength = group.length;

        final list = group + teacher;

        _names = list.map<String>((e) {
          final name = e + '#$str=${i++}';

          if (i >= groupLength && str == 'group') {
            str = 'teacher';
            i = 0;
          }

          return name;
        }).toList();

        emit(LoadedState());
      },
    );

    on<NoInternet>((event, emit) => emit(NoInternetState()));
  }

  void getSuggestionsText(String group, String query) {
    final name = group.split('#')[0];

    queryText = name.substring(0, query.length);
    nameText = name.substring(query.length);
  }

  List<String> getNames(var query) {
    final suggestions = _names.isEmpty
        ? _names
        : _names.where(
            (String name) {
              final queryText = query.toLowerCase();
              final nameText = name.toLowerCase();
              return nameText.startsWith(queryText);
            },
          ).toList();
    return suggestions;
  }
}
