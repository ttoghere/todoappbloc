part of 'active_todos_list_bloc.dart';

abstract class ActiveTodosListEvent extends Equatable {
  const ActiveTodosListEvent();

  @override
  List<Object> get props => [];
}

class CalculateActiveTodoCount extends ActiveTodosListEvent {
  final int activeTodoListCount;
  CalculateActiveTodoCount({required this.activeTodoListCount});
  @override
  String toString() {
    " CalculateActiveTodoCount(activeTodoListCount: $activeTodoListCount)";
    return super.toString();
  }

  @override
  // TODO: implement props
  List<Object> get props => [activeTodoListCount];
}
