part of 'todo_filter_bloc_bloc.dart';

class TodoFilterBlocState extends Equatable {
  final Filter filter;
  TodoFilterBlocState({required this.filter});
  @override
  // TODO: implement props
  List<Object?> get props => [filter];

  factory TodoFilterBlocState.initial() {
    return TodoFilterBlocState(filter: Filter.all);
  }

  @override
  String toString() {
    "TodoFilterBlocState(filter: $filter)";
    return super.toString();
  }

  TodoFilterBlocState copyWith({
    Filter? filter,
  }) {
    return TodoFilterBlocState(filter: filter ?? this.filter);
  }
}
