part of 'sort_bloc.dart';

abstract class SortEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const SortEvent();
}

// class SortInitialEvent extends SortEvent {}

class SortInitialEvent extends SortEvent {
  final String title;

  @override
  List<Object?> get props => [title];

  const SortInitialEvent({required this.title});
}

class SortBlocResult extends SortEvent {
  final String result;
  final String sortingStrategy;
  final String title;

  @override
  List<Object?> get props => [result, sortingStrategy, title];

  const SortBlocResult(
      {required this.result,
      required this.sortingStrategy,
      required this.title});
}
