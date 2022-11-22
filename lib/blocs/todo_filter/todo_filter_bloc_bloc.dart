import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoappbloc/models/todo_model.dart';

part 'todo_filter_bloc_event.dart';
part 'todo_filter_bloc_state.dart';

class TodoFilterBlocBloc
    extends Bloc<TodoFilterBlocEvent, TodoFilterBlocState> {
  TodoFilterBlocBloc() : super(TodoFilterBlocState.initial()) {
    on<ChangeFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
  }
}
