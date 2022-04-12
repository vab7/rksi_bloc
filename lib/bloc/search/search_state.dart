part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class LoadingState extends SearchState {}

class LoadedState extends SearchState {}

class NoInternetState extends SearchState {}
