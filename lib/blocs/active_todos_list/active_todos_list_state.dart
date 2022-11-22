part of 'active_todos_list_bloc.dart';

abstract class ActiveTodosListState extends Equatable {
  const ActiveTodosListState();
  
  @override
  List<Object> get props => [];
}

class ActiveTodosListInitial extends ActiveTodosListState {}
