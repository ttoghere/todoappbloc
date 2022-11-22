import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:todoappbloc/cubits/cubits_shelf.dart';
// import 'package:todoappbloc/models/todo_model.dart';
// import 'dart:async';

part 'active_todo_list_state.dart';

class ActiveTodoListCubit extends Cubit<ActiveTodoListState> {
  // late final StreamSubscription todoListSubscription;
  // final TodoListCubit todoListCubit;
  final int initialActiveTodoCount;
  ActiveTodoListCubit({required this.initialActiveTodoCount})
      : super(ActiveTodoListState(activeTodo: initialActiveTodoCount));

  void calculateActiveTodoCount(int activeTodoCount) {
    emit(state.copyWith(activeTodo: activeTodoCount));
  }

  // @override
  // Future<void> close() {
  //   todoListSubscription.cancel();
  //   return super.close();
  // }

}
