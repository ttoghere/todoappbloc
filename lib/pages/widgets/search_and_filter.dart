// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'package:todoappbloc/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todoappbloc/cubits/todo_search/todo_search_cubit.dart';
import 'package:todoappbloc/models/todo_model.dart';

class SearchAndFilterTodo extends StatelessWidget {
  const SearchAndFilterTodo({Key? key}) : super(key: key);

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
              context.read<TodoSearchCubit>().setSearchTerm(newSearchTerm);
            }
          },
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // filterButton(context, Filter.all),
            // filterButton(context, Filter.active),
            // filterButton(context, Filter.completed),
            FilterButton(context: context, filter: Filter.all),
            FilterButton(context: context, filter: Filter.active),
            FilterButton(context: context, filter: Filter.completed),
          ],
        )
      ],
    );
  }

  // Widget filterButton(BuildContext context, Filter filter) {
  //   return TextButton(
  //     onPressed: () {
  //       context.read<TodoFilterCubit>().changeFilter(filter);
  //     },
  //     child: Text(
  //       filter == Filter.all
  //           ? "All"
  //           : filter == Filter.active
  //               ? "Active"
  //               : "Completed",
  //       style: TextStyle(fontSize: 18, color: textColor(context, filter)),
  //     ),
  //   );
  // }

  // Color textColor(BuildContext context, Filter filter) {
  //   final currentFilter = context.watch<TodoFilterCubit>().state.filter;
  //   return currentFilter == filter ? Colors.red[900]! : Colors.black;
  // }
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
        context.read<TodoFilterCubit>().changeFilter(filter);
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
  final currentFilter = context.watch<TodoFilterCubit>().state.filter;
  return currentFilter == filter ? Colors.red[900]! : Colors.black;
}
