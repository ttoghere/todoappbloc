import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'todo_search_bloc_event.dart';
part 'todo_search_bloc_state.dart';

class TodoSearchBlocBloc
    extends Bloc<TodoSearchBlocEvent, TodoSearchBlocState> {
  TodoSearchBlocBloc() : super(TodoSearchBlocState.initial()) {
    on<SetSearchTermEvent>((event, emit) {
      emit(state.copyWith(searchTerm: event.newSearchTerm));
    }, transformer: debounce(Duration(milliseconds: 700)));
  }

  EventTransformer<SetSearchTermEvent> debounce<SetSearchTermEvent>(
      Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
