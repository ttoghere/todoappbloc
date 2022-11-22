part of 'filtered_todos_bloc_bloc.dart';

class FilteredTodosBlocState extends Equatable {
  final List<Todo> filteredTodos;
  FilteredTodosBlocState({required this.filteredTodos});
  @override
  // TODO: implement props
  List<Object?> get props => [filteredTodos];

  factory FilteredTodosBlocState.initial() {
    return FilteredTodosBlocState(filteredTodos: []);
  }

  @override
  String toString() {
    "FilteredTodosBlocState(filteredTodos: $filteredTodos)";
    return super.toString();
  }

  FilteredTodosBlocState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosBlocState(
        filteredTodos: filteredTodos ?? this.filteredTodos);
  }
}
