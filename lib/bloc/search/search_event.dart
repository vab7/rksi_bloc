part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class Initial extends SearchEvent {}

class LoadGroups extends SearchEvent {}

class NoInternet extends SearchEvent {}
