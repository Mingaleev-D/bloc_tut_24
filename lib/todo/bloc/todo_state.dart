part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<String> todosList;
  const TodoState({
    this.todosList = const [],
  });

  @override
  // TODO: implement props
  List<Object?> get props => [todosList];

  TodoState copyWith({
    List<String>? todosList,
  }) {
    return TodoState(
      todosList: todosList ?? this.todosList,
    );
  }
}
