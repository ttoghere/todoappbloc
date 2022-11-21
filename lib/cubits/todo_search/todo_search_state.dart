// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;
  TodoSearchState({
    required this.searchTerm,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [searchTerm];

  factory TodoSearchState.initial() {
    return TodoSearchState(searchTerm: "");
  }

  @override
  String toString() {
    "TodoSearchState(filter: $searchTerm)";
    return super.toString();
  }

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(searchTerm: searchTerm ?? this.searchTerm);
  }
}
