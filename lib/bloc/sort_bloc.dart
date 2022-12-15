import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/common/strategy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sort_event.dart';
part 'sort_state.dart';

class SortBloc extends Bloc<SortEvent, SortState> {
  SortBloc() : super(const SortState.initial()) {
    on<SortInitialEvent>(_onInit);
    on<SortBlocResult>(_onSubmit);
  }

  @override
  Future<void> close() async {
    //cancel streams
    await super.close();
  }

  Future<void> _onInit(
    SortInitialEvent event,
    Emitter<SortState> emit,
  ) async {
    emit(
      SortState(
        title: event.title,
      ),
    );
  }

  Future<void> _onSubmit(
    SortBlocResult event,
    Emitter<SortState> emit,
  ) async {
    List<String> textToList = event.result.split("");
    List<String> sortedText = [];

    if (event.sortingStrategy == 'null' ||
        event.sortingStrategy == 'Select Strategy') {
      sortedText = textToList;
    }
    if (event.sortingStrategy == 'Quick Sort') {
      sortedText = textToList.quickSort();
    }

    //merging sort does not work yet
    if (event.sortingStrategy == 'Merge Sort') {
      // var chunks = [];
      // int chunkSize = 2;
      // for (var i = 0; i < textToList.length; i += chunkSize) {
      //   chunks.add(textToList.sublist(i,
      //       i + chunkSize > letters.length ? letters.length : i + chunkSize));
      // }
      // return chunks;
      // sortedText = textToList.mergeSort();
      sortedText = textToList;
    }

    //bubble sort does not work
    if (event.sortingStrategy == 'Bubble Sort') {
      sortedText = textToList;
    }

    print(sortedText);

    emit(
      SortState(
        result: sortedText,
        title: event.title,
      ),
    );
  }
}
