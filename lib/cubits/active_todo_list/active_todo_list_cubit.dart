import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoappbloc/cubits/cubits_shelf.dart';
import 'package:todoappbloc/models/todo_model.dart';

part 'active_todo_list_state.dart';

class ActiveTodoListCubit extends Cubit<ActiveTodoListState> {
  late final StreamSubscription todoListSubscription;
  final TodoListCubit todoListCubit;
  ActiveTodoListCubit({required this.todoListCubit})
      : super(ActiveTodoListState.initial()) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print("todoListState: $todoListState");

      final int currentActiveTodoCount = todoListState.todoList
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;

      emit(state.copyWith(activeTodo: currentActiveTodoCount));
    });
  }
  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
