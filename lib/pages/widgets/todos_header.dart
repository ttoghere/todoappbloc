import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:todoappbloc/cubits/cubits_shelf.dart';
import 'package:todoappbloc/models/todo_model.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "TODO",
          style: TextStyle(fontSize: 40),
        ),
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            final int activeTodoCount = state.todoList
                .where((Todo todo) => !todo.completed)
                .toList()
                .length;
            context
                .read<ActiveTodoListCubit>()
                .calculateActiveTodoCount(activeTodoCount);
          },
          child: BlocBuilder<ActiveTodoListCubit, ActiveTodoListState>(
            builder: (context, state) => Text(
              "${state.activeTodo} Items Left",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red[900],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
