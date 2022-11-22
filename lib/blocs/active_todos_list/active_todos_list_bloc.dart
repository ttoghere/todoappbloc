import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_todos_list_event.dart';
part 'active_todos_list_state.dart';

class ActiveTodosListBloc extends Bloc<ActiveTodosListEvent, ActiveTodosListState> {
  ActiveTodosListBloc() : super(ActiveTodosListInitial()) {
    on<ActiveTodosListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
