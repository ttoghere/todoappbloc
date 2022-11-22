import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todoappbloc/blocs/bloc_shelf.dart';
import 'package:todoappbloc/cubits/cubits_shelf.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final TextEditingController newTodoController = TextEditingController();
  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      decoration: InputDecoration(
        label: Text("What to do ?"),
      ),
      onSubmitted: (String? todoDesc) {
        if (todoDesc != null && todoDesc.trim().isNotEmpty) {
          context
              .read<TodoListBlocBloc>()
              .add(AddTodoEvent(todoDesc: todoDesc));
          newTodoController.clear();
        }
      },
    );
  }
}
