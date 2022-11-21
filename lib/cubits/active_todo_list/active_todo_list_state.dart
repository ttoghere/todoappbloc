part of 'active_todo_list_cubit.dart';


class ActiveTodoListState extends Equatable {
  final int activeTodo;
  ActiveTodoListState({required this.activeTodo});
  @override
  // TODO: implement props
  List<Object?> get props => [activeTodo];

  factory ActiveTodoListState.initial() {
    return ActiveTodoListState(activeTodo: 0);
  }

  @override
  String toString() {
    "ActiveTodoListState(todoList: $activeTodo)";
    return super.toString();
  }

  ActiveTodoListState copyWith({
    int? activeTodo,
  }) {
    return ActiveTodoListState(activeTodo: activeTodo ?? this.activeTodo);
  }
}
