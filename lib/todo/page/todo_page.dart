import 'package:bloc_tut_24/todo/bloc/todo_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return const Center(
              child: Text('No Todo Found'),
            );
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(state.todosList[index]),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.delete)),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            for (int i = 0; i < 10; i++) {
              context
                  .read<TodoBloc>()
                  .add(AddTodoEvent(task: 'Task: ${i.toString()}'));
            }
          },
          child: const Icon(CupertinoIcons.add)),
    );
  }
}
