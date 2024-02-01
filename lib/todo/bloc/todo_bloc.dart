import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todosList = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>((event, emit) {
      todosList.add(event.task);
      emit(state.copyWith(todosList: List.from(todosList)));
    });
  }
}
