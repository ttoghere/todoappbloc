import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoappbloc/blocs/todo_filter/todo_filter_bloc_bloc.dart';
import 'package:todoappbloc/blocs/todo_list/todo_list_bloc_bloc.dart';
import 'package:todoappbloc/blocs/todo_search/todo_search_bloc_bloc.dart';
import 'package:todoappbloc/models/todo_model.dart';

part 'filtered_todos_bloc_event.dart';
part 'filtered_todos_bloc_state.dart';

class FilteredTodosBlocBloc
    extends Bloc<FilteredTodosBlocEvent, FilteredTodosBlocState> {
  final List<Todo> initialTodos;
  FilteredTodosBlocBloc({
    required this.initialTodos,
  }) : super(FilteredTodosBlocState(filteredTodos: initialTodos)) {
    on<CalculateFilteredTodosEvent>((event, emit) {
      emit(state.copyWith(filteredTodos: event.filteredTodos));
    });
  }
  // void setFilteredTodos() {
  //   List<Todo> _filteredTodos;
  //   switch (todoFilterBlocBloc.state.filter) {
  //     case Filter.active:
  //       _filteredTodos = todoListBlocBloc.state.todoList
  //           .where((Todo todo) => !todo.completed)
  //           .toList();

  //       break;
  //     case Filter.completed:
  //       _filteredTodos = todoListBlocBloc.state.todoList
  //           .where((Todo todo) => todo.completed)
  //           .toList();
  //       break;
  //     case Filter.all:
  //     default:
  //       _filteredTodos = todoListBlocBloc.state.todoList;
  //       break;
  //   }
  //   if (todoSearchBlocBloc.state.searchTerm.isNotEmpty) {
  //     _filteredTodos = _filteredTodos
  //         .where((Todo todo) => todo.desc
  //             .toLowerCase()
  //             .contains(todoSearchBlocBloc.state.searchTerm))
  //         .toList();
  //   }

  //   add(CalculateFilteredTodosEvent(filteredTodos: _filteredTodos));
  // }

}
