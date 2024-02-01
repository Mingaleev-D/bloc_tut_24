part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodoEvent extends TodoEvent {
  final String task;
  const AddTodoEvent({
    required this.task,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [task];
}

class RemoveTodoEvent extends TodoEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
