// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todoappbloc/blocs/bloc_shelf.dart';
import 'package:todoappbloc/models/todo_model.dart';
import 'package:todoappbloc/utils/debounce.dart';

class SearchAndFilterTodo extends StatelessWidget {
  final debounce = Debounce(milliseconds: 700);
  SearchAndFilterTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Search Todos...",
            border: InputBorder.none,
            filled: true,
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              debounce.run(() {
                context
                    .read<TodoSearchBlocBloc>()
                    .add(SetSearchTermEvent(newSearchTerm: newSearchTerm));
              });
            }
          },
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterButton(context: context, filter: Filter.all),
            FilterButton(context: context, filter: Filter.active),
            FilterButton(context: context, filter: Filter.completed),
          ],
        )
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  final BuildContext context;
  final Filter filter;
  const FilterButton({
    Key? key,
    required this.context,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context
            .read<TodoFilterBlocBloc>()
            .add(ChangeFilterEvent(newFilter: filter));
      },
      child: Text(
        filter == Filter.all
            ? "All"
            : filter == Filter.active
                ? "Active"
                : "Completed",
        style: TextStyle(
            fontSize: 18, color: textColor(context: context, filter: filter)),
      ),
    );
  }
}

Color textColor({required BuildContext context, required Filter filter}) {
  final currentFilter = context.watch<TodoFilterBlocBloc>().state.filter;
  return currentFilter == filter ? Colors.red[900]! : Colors.black;
}
