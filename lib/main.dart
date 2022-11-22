import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoappbloc/cubits/cubits_shelf.dart';
import 'package:todoappbloc/pages/pages_shelf.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<TodoSearchCubit>(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<ActiveTodoListCubit>(
          create: (context) => ActiveTodoListCubit(
            initialActiveTodoCount:
                context.read<TodoListCubit>().state.todoList.length,
          ),
        ),
        BlocProvider<FilteredTodosCubit>(
          create: (context) => FilteredTodosCubit(
            initialTodos: context.read<TodoListCubit>().state.todoList,
          ),
        )
      ],
      child: MaterialApp(
        title: 'Todos App',
        home: TodosPage(),
      ),
    );
  }
}
