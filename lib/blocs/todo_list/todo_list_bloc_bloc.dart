import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:todoappbloc/models/todo_model.dart';

part 'todo_list_bloc_event.dart';
part 'todo_list_bloc_state.dart';

class TodoListBlocBloc extends Bloc<TodoListBlocEvent, TodoListBlocState> {
  TodoListBlocBloc() : super(TodoListBlocState.initial()) {
    on<AddTodoEvent>(addTodo);
    on<EditTodoEvent>(editTodo);
    on<RemoveTodoEvent>(removeTodos);
    on<ToggleTodoEvent>(toggleTodos);
  }

  void addTodo(AddTodoEvent event, Emitter<TodoListBlocState> emit) {
    final newTodo = Todo(desc: event.todoDesc);
    final newTodos = [...state.todoList, newTodo];
    emit(state.copyWith(todoList: newTodos));
  }

  void editTodo(EditTodoEvent event, Emitter<TodoListBlocState> emit) {
    final newTodos = state.todoList.map((Todo todo) {
      if (todo.id == event.id) {
        return Todo(
          desc: event.todoDesc,
          id: event.id,
          completed: todo.completed,
        );
      }
      return todo;
    }).toList();
    emit(state.copyWith(todoList: newTodos));
  }

  void toggleTodos(ToggleTodoEvent event, Emitter<TodoListBlocState> emit) {
    final newTodos = state.todoList.map((Todo todo) {
      if (todo.id == event.id) {
        return Todo(
          desc: todo.desc,
          id: event.id,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();
    emit(state.copyWith(todoList: newTodos));
  }

  void removeTodos(RemoveTodoEvent event, Emitter<TodoListBlocState> emit) {
    final newTodos =
        state.todoList.where((Todo t) => t.id != event.todo.id).toList();
    emit(state.copyWith(todoList: newTodos));
  }
}
