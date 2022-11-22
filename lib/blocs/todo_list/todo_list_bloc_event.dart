// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_list_bloc_bloc.dart';

abstract class TodoListBlocEvent extends Equatable {
  const TodoListBlocEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListBlocEvent {
  final String todoDesc;
  AddTodoEvent({required this.todoDesc});

  @override
  String toString() {
    "AddTodoEvent(todoDesc: $todoDesc)";
    return super.toString();
  }

  @override
  // TODO: implement props
  List<Object> get props => [todoDesc];
}

class EditTodoEvent extends TodoListBlocEvent {
  final String todoDesc;
  final String id;
  EditTodoEvent({
    required this.todoDesc,
    required this.id,
  });

  @override
  String toString() {
    "EditTodoEvent(todoDesc: $todoDesc, id: $id)";
    return super.toString();
  }

  @override
  // TODO: implement props
  List<Object> get props => [todoDesc, id];
}

class ToggleTodoEvent extends TodoListBlocEvent {
  final String id;
  ToggleTodoEvent({
    required this.id,
  });

  @override
  String toString() {
    "ToggleTodoEvent(id: $id)";
    return super.toString();
  }

  @override
  // TODO: implement props
  List<Object> get props => [id];
}

class RemoveTodoEvent extends TodoListBlocEvent {
  final Todo todo;
  RemoveTodoEvent({required this.todo});

  @override
  String toString() {
    "RemoveTodoEvent(todo: $todo)";
    return super.toString();
  }

  @override
  // TODO: implement props
  List<Object> get props => [todo];
}
