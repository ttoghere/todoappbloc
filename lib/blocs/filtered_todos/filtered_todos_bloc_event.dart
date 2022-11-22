part of 'filtered_todos_bloc_bloc.dart';

abstract class FilteredTodosBlocEvent extends Equatable {
  const FilteredTodosBlocEvent();

  @override
  List<Object> get props => [];
}

class CalculateFilteredTodosEvent extends FilteredTodosBlocEvent {
  final List<Todo> filteredTodos;
  CalculateFilteredTodosEvent({required this.filteredTodos});
  @override
  String toString() {
    "CalculateFilteredTodosEvent(filteredTodos: $filteredTodos)";
    return super.toString();
  }

  @override
  // TODO: implement props
  List<Object> get props => [filteredTodos];
}
