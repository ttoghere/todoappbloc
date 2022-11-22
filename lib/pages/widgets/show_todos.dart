// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

import 'package:todoappbloc/cubits/cubits_shelf.dart';
import 'package:todoappbloc/models/todo_model.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = context.watch<FilteredTodosCubit>().state.filteredTodos;
    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            context.read<FilteredTodosCubit>().setFilteredTodos(
                  filter: context.read<TodoFilterCubit>().state.filter,
                  todoList: state.todoList,
                  searchTerm: context.read<TodoSearchCubit>().state.searchTerm,
                );
          },
        ),
        BlocListener<TodoFilterCubit, TodoFilterState>(
          listener: (context, state) {
            context.read<FilteredTodosCubit>().setFilteredTodos(
                  filter: state.filter,
                  todoList: context.read<TodoListCubit>().state.todoList,
                  searchTerm: context.read<TodoSearchCubit>().state.searchTerm,
                );
          },
        ),
        BlocListener<TodoSearchCubit, TodoSearchState>(
          listener: (context, state) {
            context.read<FilteredTodosCubit>().setFilteredTodos(
                  filter: context.read<TodoFilterCubit>().state.filter,
                  todoList: context.read<TodoListCubit>().state.todoList,
                  searchTerm: state.searchTerm,
                );
          },
          child: Container(),
        )
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
                  context.read<TodoListCubit>().removeTodos(todos[index]);
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
                          context.read<TodoListCubit>().editTodo(
                                widget.todo.id,
                                textEditingController.text,
                              );
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
          context.read<TodoListCubit>().toggleTodos(widget.todo.id);
        },
      ),
      title: Text(widget.todo.desc),
    );
  }
}
