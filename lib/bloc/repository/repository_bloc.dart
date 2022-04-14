import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rksi_bloc/data/impl/database/database_impl.dart';
import 'package:rksi_bloc/data/impl/repository/connectivity_impl.dart';
import 'package:rksi_bloc/data/impl/repository/repository_impl.dart';
import 'package:rksi_bloc/data/model/date.dart';
import 'package:rksi_bloc/resources/constants/constants.dart';

part 'repository_event.dart';
part 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  String? title;
  String? type;

  List<Date>? _dates;
  List<String>? _item;

  RepositoryBloc() : super(LoadingState()) {
    on<InitialEvent>(
      (event, emit) async {
        final connectivity = await Connectivity().checkConnectivity();
        if (connectivity == ConnectivityResult.none) {
          _dates = await _getDateFromDatabase();
          type = await _getTypeFromDatabase();

          if (_dates != null && type != null) {
            add(LoadFromDatabase());
          } else {
            add(NoInternet());

            ConnectivityImpl().connectivityStream.stream.listen(
              (event) {
                if (event != ConnectivityResult.none) {
                  add(const LoadFromApi(firstGroup));
                }
              },
            );
          }
        } else {
          _item = await _getItemFromDatabase();

          if (_item == null) {
            add(const LoadFromApi(firstGroup));
          } else {
            add(LoadFromApi('${_item![0]}=${_item![1]}'));
          }
        }
      },
    );

    on<LoadFromDatabase>((event, emit) {
      _setTitle();
      emit(LoadedState(_dates!));
    });

    on<LoadFromApi>(
      (event, emit) async {
        emit(LoadingState());

        _item = event.result.split('=');

        type = _item![0];
        final index = _item![1];

        _dates = await RepositoryImpl<Date>()
            .getRepository(type: '=$type', item: '&item', index: '=$index');

        _saveData();

        _setTitle();

        emit(LoadedState(_dates!));
      },
    );

    on<NoInternet>((event, emit) => emit(NoInternetState()));
  }

  void _saveData() {
    DatabaseImpl<List<dynamic>>()
        .saveData(boxName: dateBox, key: dateKey, value: _dates!);

    DatabaseImpl<List<dynamic>>()
        .saveData(boxName: itemBox, key: itemKey, value: _item!);

    DatabaseImpl<dynamic>()
        .saveData(boxName: typeBox, key: typeKey, value: type!);
  }

  Future<List<Date>?> _getDateFromDatabase() async {
    var dates = await DatabaseImpl<List<dynamic>>()
        .getData(boxName: dateBox, key: dateKey) as List<Date>?;

    return dates;
  }

  Future<String?> _getTypeFromDatabase() async {
    var type = await DatabaseImpl<dynamic>()
        .getData(boxName: typeBox, key: typeKey) as String?;

    return type;
  }

  Future<List<String>?> _getItemFromDatabase() async {
    final item = await DatabaseImpl<List<dynamic>>()
        .getData(boxName: itemBox, key: itemKey) as List<String>?;

    return item;
  }

  void _setTitle() {
    final name = _dates![0].schedule[0];

    title = type == 'group' ? name.group : name.teacher;
  }
}
