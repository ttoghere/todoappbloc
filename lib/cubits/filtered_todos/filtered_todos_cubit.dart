// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todoappbloc/cubits/cubits_shelf.dart';
import 'package:todoappbloc/models/todo_model.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final List<Todo> initialTodos;
  FilteredTodosCubit({
    required this.initialTodos,
  }) : super(FilteredTodosState(filteredTodos: initialTodos));

  void setFilteredTodos(
      {required Filter filter,
      required List<Todo> todoList,
      required String searchTerm}) {
    List<Todo> _filteredTodos;
    switch (filter) {
      case Filter.all:
        _filteredTodos = todoList;
        break;
      case Filter.active:
        _filteredTodos =
            todoList.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos = todoList.where((Todo todo) => todo.completed).toList();
        break;
    }
    if (searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) => todo.desc.toLowerCase().contains(searchTerm))
          .toList();
    }

    emit(state.copyWith(filteredTodos: _filteredTodos));
  }
}
