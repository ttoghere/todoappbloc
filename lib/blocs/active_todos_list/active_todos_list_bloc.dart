import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoappbloc/blocs/todo_list/todo_list_bloc_bloc.dart';
import 'package:todoappbloc/models/todo_model.dart';

part 'active_todos_list_event.dart';
part 'active_todos_list_state.dart';

class ActiveTodosListBloc
    extends Bloc<ActiveTodosListEvent, ActiveTodoListBlocState> {
  late final StreamSubscription todoListSubscription;
  final int initialActiveTodoCount;
  final TodoListBlocBloc todoListBlocBloc;
  ActiveTodosListBloc(
      {required this.initialActiveTodoCount, required this.todoListBlocBloc})
      : super(ActiveTodoListBlocState(activeTodo: initialActiveTodoCount)) {
    todoListSubscription =
        todoListBlocBloc.stream.listen((TodoListBlocState todoListBlocState) {
      print("todoListState: $todoListBlocState");
      final int currentActiveTodoCount = todoListBlocState.todoList
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;
      add(CalculateActiveTodoCount(
          activeTodoListCount: currentActiveTodoCount));
    });
    on<CalculateActiveTodoCount>((event, emit) {
      emit(state.copyWith(activeTodo: event.activeTodoListCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
