// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:todoappbloc/blocs/bloc_shelf.dart';
import 'package:todoappbloc/models/todo_model.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);
  List<Todo> setFilteredTodos({
    required Filter filter,
    required List<Todo> todoList,
    required String searchTerm,
  }) {
    List<Todo> _filteredTodos;
    switch (filter) {
      case Filter.active:
        _filteredTodos =
            todoList.where((Todo todo) => !todo.completed).toList();

        break;
      case Filter.completed:
        _filteredTodos = todoList.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todoList;
        break;
    }
    if (searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) => todo.desc.toLowerCase().contains(searchTerm))
          .toList();
    }

    return _filteredTodos;
  }

  @override
  Widget build(BuildContext context) {
    List<Todo> todos =
        context.watch<FilteredTodosBlocBloc>().state.filteredTodos;
    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListBlocBloc, TodoListBlocState>(
          listener: (context, state) {
            final filteredTodos = setFilteredTodos(
              filter: context.read<TodoFilterBlocBloc>().state.filter,
              todoList: state.todoList,
              searchTerm: context.read<TodoSearchBlocBloc>().state.searchTerm,
            );
            context
                .read<FilteredTodosBlocBloc>()
                .add(CalculateFilteredTodosEvent(filteredTodos: filteredTodos));
          },
        ),
        BlocListener<TodoSearchBlocBloc, TodoSearchBlocState>(
          listener: (context, state) {
            final filteredTodos = setFilteredTodos(
              filter: context.read<TodoFilterBlocBloc>().state.filter,
              todoList: context.read<TodoListBlocBloc>().state.todoList,
              searchTerm: state.searchTerm,
            );
            context
                .read<FilteredTodosBlocBloc>()
                .add(CalculateFilteredTodosEvent(filteredTodos: filteredTodos));
          },
        ),
        BlocListener<TodoFilterBlocBloc, TodoFilterBlocState>(
          listener: (context, state) {
            final filteredTodos = setFilteredTodos(
              filter: state.filter,
              todoList: context.read<TodoListBlocBloc>().state.todoList,
              searchTerm: context.read<TodoSearchBlocBloc>().state.searchTerm,
            );
            context
                .read<FilteredTodosBlocBloc>()
                .add(CalculateFilteredTodosEvent(filteredTodos: filteredTodos));
          },
        ),
      ],
      child: ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return Dismissible(
                confirmDismiss: (direction) {
                  return showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Are you sure?"),
                      content: Text("Do you really want to delete?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text("Yes")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text("No")),
                      ],
                    ),
                  );
                },
                onDismissed: (direction) {
                  context
                      .read<TodoListBlocBloc>()
                      .add(RemoveTodoEvent(todo: todos[index]));
                },
                background: ShowBackground(
                  direction: 0,
                ),
                secondaryBackground: ShowBackground(
                  direction: 1,
                ),
                key: ValueKey(todos[index].id),
                child: TodoItem(todo: todos[index]));
          },
          separatorBuilder: (context, index) => Divider(
                thickness: 2,
                color: Colors.blue[900],
              ),
          itemCount: todos.length),
    );
  }
}

class ShowBackground extends StatelessWidget {
  final int direction;
  const ShowBackground({
    Key? key,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Icon(
        Icons.delete,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}

class TodoItem extends StatefulWidget {
  final Todo todo;
  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            bool _error = false;
            textEditingController.text = widget.todo.desc;
            return StatefulBuilder(builder: (context, state) {
              return AlertDialog(
                title: Text("Edit Todo"),
                content: TextField(
                  controller: textEditingController,
                  autofocus: true,
                  decoration: InputDecoration(
                      errorText: _error ? "Value cannot be empth" : null),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _error =
                            textEditingController.text.isEmpty ? true : false;
                        if (!_error) {
                          context.read<TodoListBlocBloc>().add(EditTodoEvent(
                                todoDesc: textEditingController.text,
                                id: widget.todo.id,
                              ));

                          Navigator.of(context).pop();
                        }
                      });
                    },
                    child: Text("Edit"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                ],
              );
            });
          },
        );
      },
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: (bool? checked) {
          context
              .read<TodoListBlocBloc>()
              .add(ToggleTodoEvent(id: widget.todo.id));
        },
      ),
      title: Text(widget.todo.desc),
    );
  }
}
