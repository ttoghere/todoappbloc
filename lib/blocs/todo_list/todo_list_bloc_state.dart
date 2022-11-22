part of 'todo_list_bloc_bloc.dart';

class TodoListBlocState extends Equatable {
  final List<Todo> todoList;
  TodoListBlocState({required this.todoList});
  @override
  // TODO: implement props
  List<Object?> get props => [todoList];

  factory TodoListBlocState.initial() {
    return TodoListBlocState(todoList: [
      Todo(desc: "Clean The Room", id: "1"),
      Todo(desc: "Clean The Dishes", id: "2"),
      Todo(desc: "Write Codes", id: "3"),
    ]);
  }

  @override
  String toString() {
    "TodoListBlocState(todoList: $todoList)";
    return super.toString();
  }

  TodoListBlocState copyWith({
    List<Todo>? todoList,
  }) {
    return TodoListBlocState(todoList: todoList ?? this.todoList);
  }
}
