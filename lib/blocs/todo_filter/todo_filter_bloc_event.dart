part of 'todo_filter_bloc_bloc.dart';

abstract class TodoFilterBlocEvent extends Equatable {
  const TodoFilterBlocEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends TodoFilterBlocEvent {
  final Filter newFilter;
  ChangeFilterEvent({required this.newFilter});
  @override
  String toString() {
    "ChangeFilterEvent(newFilter: $newFilter)";
    return super.toString();
  }

  @override
  List<Object> get props => [newFilter];
}
