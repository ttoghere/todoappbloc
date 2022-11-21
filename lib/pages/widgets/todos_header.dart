import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todoappbloc/cubits/cubits_shelf.dart';


class TodoHeader extends StatelessWidget {
  const TodoHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = context.watch<ActiveTodoListCubit>().state.activeTodo;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "TODO",
          style: TextStyle(fontSize: 40),
        ),
        Text(
          "${count} Items Left",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.red[900],
          ),
        ),
      ],
    );
  }
}
