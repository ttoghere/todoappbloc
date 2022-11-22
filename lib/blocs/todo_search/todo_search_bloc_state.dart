part of 'todo_search_bloc_bloc.dart';

class TodoSearchBlocState extends Equatable {
  final String searchTerm;
  TodoSearchBlocState({
    required this.searchTerm,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [searchTerm];

  factory TodoSearchBlocState.initial() {
    return TodoSearchBlocState(searchTerm: "");
  }

  @override
  String toString() {
    "TodoSearchBlocState(filter: $searchTerm)";
    return super.toString();
  }

  TodoSearchBlocState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchBlocState(searchTerm: searchTerm ?? this.searchTerm);
  }
}
