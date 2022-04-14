part of 'repository_bloc.dart';

abstract class RepositoryEvent extends Equatable {
  const RepositoryEvent();

  @override
  List<Object> get props => [];
}

class LoadFromApi extends RepositoryEvent {
  final String result;
  const LoadFromApi(this.result);
}

class LoadFromDatabase extends RepositoryEvent {}

class InitialEvent extends RepositoryEvent {}

class NoInternet extends RepositoryEvent {}
