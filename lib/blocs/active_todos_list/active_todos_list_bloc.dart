import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_todos_list_event.dart';
part 'active_todos_list_state.dart';

class ActiveTodosListBloc
    extends Bloc<ActiveTodosListEvent, ActiveTodoListBlocState> {
  final int initialActiveTodoCount;
  ActiveTodosListBloc({
    required this.initialActiveTodoCount,
  }) : super(ActiveTodoListBlocState(activeTodo: initialActiveTodoCount)) {
    on<CalculateActiveTodoCount>((event, emit) {
      emit(state.copyWith(activeTodo: event.activeTodoListCount));
    });
  }
}
