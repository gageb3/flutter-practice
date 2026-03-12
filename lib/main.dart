import 'package:flutter/material.dart';
import 'managers/expense_manager.dart';
import 'models/categories.dart';
import 'package:expense_tracker/models/recurring_expense.dart';

void main() {
  final manager = ExpenseManager();

  // Create a recurring expense object with its details
  final recurring = RecurringExpense(
    id: 'r001',
    amountCents: 1000,
    date: DateTime(2025, 7, 1),
    category: Category.food,
    description: 'Weekly snack',
    frequency: Frequency.weekly,
    occurrences: 4, // repeats 4 times
  );

  manager.addRecurringExpense(recurring);

  // Print all expenses
  final expenses = manager.getAllExpenses();
  for (var expense in expenses) {
    print(expense);
  }

  // Print total in dollars with text
  final totalCents = manager.getTotalExpenses();
  final totalDollars = totalCents / 100;
  print("Total: \$${totalDollars.toStringAsFixed(2)}");

  runApp(
    MaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Expense Tracker')),
        body: Center(child: Text('App is starting...')),
      ),
    ),
  );
}
