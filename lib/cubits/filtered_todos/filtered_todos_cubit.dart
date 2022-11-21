// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todoappbloc/cubits/cubits_shelf.dart';
import 'package:todoappbloc/models/todo_model.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  late StreamSubscription todoFilterSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoListSubscription;
  //
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;
  FilteredTodosCubit(
    this.todoFilterSubscription,
    this.todoSearchSubscription,
    this.todoListSubscription,
    this.todoFilterCubit,
    this.todoSearchCubit,
    this.todoListCubit,
  ) : super(FilteredTodosState.initial()) {
    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      setFilteredTodos();
    });
    todoSearchSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
      setFilteredTodos();
    });
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      setFilteredTodos();
    });
  }

  void setFilteredTodos() {
    List<Todo> _filteredTodos;
    switch (todoFilterCubit.state.filter) {
      case Filter.all:
        _filteredTodos = todoListCubit.state.todoList;
        break;
      case Filter.active:
        _filteredTodos = todoListCubit.state.todoList
            .where((Todo todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        _filteredTodos = todoListCubit.state.todoList
            .where((Todo todo) => todo.completed)
            .toList();
        break;
    }
    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) => todo.desc
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm))
          .toList();
    }

    emit(state.copyWith(filteredTodos: _filteredTodos));
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    return super.close();
  }
}
