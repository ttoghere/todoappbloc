import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoappbloc/blocs/bloc_shelf.dart';
import 'package:todoappbloc/pages/pages_shelf.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<TodoFilterBloc>(
        //   create: (context) => TodoFilterBloc(),
        // ),
        // BlocProvider<TodoSearchBloc>(
        //   create: (context) => TodoSearchBloc(),
        // ),
        // BlocProvider<TodoListBloc>(
        //   create: (context) => TodoListBloc(),
        // ),
        // BlocProvider<ActiveTodoListBloc>(
        //   create: (context) => ActiveTodoListBloc(
        //     initialActiveTodoCount:
        //         context.read<TodoListBloc>().state.todoList.length,
        //   ),
        // ),
        // BlocProvider<FilteredTodosBloc>(
        //   create: (context) => FilteredTodosBloc(
        //     initialTodos: context.read<TodoListBloc>().state.todoList,
        //   ),
        // ),
        BlocProvider<TodoFilterBlocBloc>(
          create: (context) => TodoFilterBlocBloc(),
        ),
        BlocProvider<TodoSearchBlocBloc>(
          create: (context) => TodoSearchBlocBloc(),
        ),
        BlocProvider<TodoListBlocBloc>(
          create: (context) => TodoListBlocBloc(),
        ),
        BlocProvider<ActiveTodosListBloc>(
          create: (context) => ActiveTodosListBloc(
            initialActiveTodoCount:
                context.read<TodoListBlocBloc>().state.todoList.length,
          ),
        ),
        BlocProvider<FilteredTodosBlocBloc>(
          create: (context) => FilteredTodosBlocBloc(
            initialTodos: context.read<TodoListBlocBloc>().state.todoList,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Todos App',
        home: TodosPage(),
      ),
    );
  }
}
