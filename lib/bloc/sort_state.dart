part of 'sort_bloc.dart';

class SortState extends Equatable {
  final String? title;
  final List<String>? result;

  @override
  List<Object?> get props => [title, result];

  const SortState({this.title, this.result});

  const SortState.initial()
      : title = '',
        result = const [];

  SortState copyWith({String? title, List<String>? result}) {
    return SortState(
      title: title ?? title,
      result: result ?? result,
    );
  }
}
