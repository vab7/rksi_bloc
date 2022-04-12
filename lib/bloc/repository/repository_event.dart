part of 'repository_bloc.dart';

abstract class RepositoryEvent extends Equatable {
  const RepositoryEvent();

  @override
  List<Object> get props => [];
}

class LoadFromApiEvent extends RepositoryEvent {
  final String result;
  const LoadFromApiEvent(this.result);
}

class LoadFromDatabaseEvent extends RepositoryEvent {}

class InitialEvent extends RepositoryEvent {}

class NoInternetEvent extends RepositoryEvent {}
