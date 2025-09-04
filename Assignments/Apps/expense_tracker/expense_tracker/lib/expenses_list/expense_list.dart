import 'package:expense_tracker/expenses_list/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenseList,
    required this.onRemoveExpense,
  });

  final List<Expense> expenseList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenseList[index]),
        background: Container(
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete_forever, color: Colors.white),
          color: Color.fromARGB(255, 255, 4, 4),
          margin: EdgeInsets.symmetric(
            // Using theme data in widgets
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            vertical: Theme.of(context).cardTheme.margin!.vertical,
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenseList[index]);
        },
        child: ExpenseItem(expenseList[index]),
      ),
    );
  }
}
