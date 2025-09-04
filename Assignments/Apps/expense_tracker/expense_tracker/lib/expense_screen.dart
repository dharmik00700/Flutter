import 'package:expense_tracker/chart/chart.dart';
import 'package:expense_tracker/expenses_list/expense_list.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';
import 'new_expense.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

final List<Expense> _registeredExpenses = [
  Expense(
    title: "Flutter Course",
    amount: 19.99,
    date: DateTime.now(),
    category: Category.work,
  ),
  Expense(
    title: "Cinema",
    amount: 15.99,
    date: DateTime.now(),
    category: Category.leisure,
  ),
];

class _ExpenseScreenState extends State<ExpenseScreen> {
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void openexpenseoverlay() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (context) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _removeExpense(Expense expense) {
    final expenseindex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted."),
        duration: Duration(seconds: 1),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseindex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Expense found. Start adding some!'),
    );
    if (_registeredExpenses.length > 0) {
      mainContent = ExpenseList(
        expenseList: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    final width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      appBar: AppBar(title: Text('Expense Tracker')),
      floatingActionButton: FloatingActionButton(
        onPressed: openexpenseoverlay,
        child: Icon(Icons.add),
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
