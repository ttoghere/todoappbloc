part of 'todo_search_bloc_bloc.dart';

abstract class TodoSearchBlocEvent extends Equatable {
  const TodoSearchBlocEvent();

  @override
  List<Object> get props => [];
}

class SetSearchTermEvent extends TodoSearchBlocEvent {
  final String newSearchTerm;
  SetSearchTermEvent({required this.newSearchTerm});

  @override
  String toString() {
    "SetSearchTermEvent(newSearchTerm: $newSearchTerm)";
    return super.toString();
  }

  @override
  // TODO: implement props
  List<Object> get props => [newSearchTerm];
}
