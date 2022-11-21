part of 'filtered_todos_cubit.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;
  FilteredTodosState({required this.filteredTodos});
  @override
  // TODO: implement props
  List<Object?> get props => [filteredTodos];

  factory FilteredTodosState.initial() {
    return FilteredTodosState(filteredTodos: []);
  }

  @override
  String toString() {
    "FilteredTodosState(filteredTodos: $filteredTodos)";
    return super.toString();
  }

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
        filteredTodos: filteredTodos ?? this.filteredTodos);
  }
}
