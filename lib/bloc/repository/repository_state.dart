part of 'repository_bloc.dart';

abstract class RepositoryState extends Equatable {
  const RepositoryState();

  @override
  List<Object> get props => [];
}

abstract class RepositoryDateState extends RepositoryState {
  final Color color;

  const RepositoryDateState(this.color);
}

class LoadingState extends RepositoryState {}

class LoadedState extends RepositoryState {
  final List<Date> date;

  const LoadedState(this.date);
}

class NoInternetState extends RepositoryState {}
