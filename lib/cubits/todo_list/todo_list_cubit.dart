import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoappbloc/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [...state.todoList, newTodo];
    emit(state.copyWith(todoList: newTodos));
  }

  void editTodo(String id, String todoDesc) {
    final newTodos = state.todoList.map((Todo todo) {
      if (todo.id == id) {
        return Todo(desc: todoDesc, id: id, completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todoList: newTodos));
  }

  void toggleTodos(String id) {
    final newTodos = state.todoList.map((Todo todo) {
      if (todo.id == id) {
        return Todo(desc: todo.desc, id: id, completed: !todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todoList: newTodos));
  }

  void removeTodos(Todo todo) {
    final newTodos = state.todoList.where((Todo t) => t.id != todo.id).toList();
    emit(state.copyWith(todoList: newTodos));
  }
}
