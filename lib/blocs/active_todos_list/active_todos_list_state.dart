part of 'active_todos_list_bloc.dart';

class ActiveTodoListBlocState extends Equatable {
  final int activeTodo;
  ActiveTodoListBlocState({required this.activeTodo});
  @override
  // TODO: implement props
  List<Object?> get props => [activeTodo];

  factory ActiveTodoListBlocState.initial() {
    return ActiveTodoListBlocState(activeTodo: 0);
  }

  @override
  String toString() {
    "ActiveTodoListBlocState(todoList: $activeTodo)";
    return super.toString();
  }

  ActiveTodoListBlocState copyWith({
    int? activeTodo,
  }) {
    return ActiveTodoListBlocState(activeTodo: activeTodo ?? this.activeTodo);
  }
}
