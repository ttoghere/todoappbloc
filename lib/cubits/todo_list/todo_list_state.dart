part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todoList;
  TodoListState({required this.todoList});
  @override
  // TODO: implement props
  List<Object?> get props => [todoList];

  factory TodoListState.initial() {
    return TodoListState(todoList: [
      Todo(desc: "Clean The Room", id: "1"),
      Todo(desc: "Clean The Dishes", id: "2"),
      Todo(desc: "Write Codes", id: "3"),
    ]);
  }

  @override
  String toString() {
    "TodoListState(todoList: $todoList)";
    return super.toString();
  }

  TodoListState copyWith({
    List<Todo>? todoList,
  }) {
    return TodoListState(todoList: todoList ?? this.todoList);
  }
}
