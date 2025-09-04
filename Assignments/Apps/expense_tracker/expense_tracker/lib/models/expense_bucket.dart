import 'package:expense_tracker/models/expense.dart';

class ExpenseBucket {
  final List<Expense> expenses;
  final Category category;

  ExpenseBucket({required this.expenses, required this.category});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
    : expenses = allExpense
          .where((expense) => expense.category == category)
          .toList();

  double get totalExpenses {
    double sum = 0;
    for (var expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
