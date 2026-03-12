import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'managers/expense_manager.dart';

void main() {
  final manager = ExpenseManager();

  final expense1 = Expense(
    id: '001',
    amountCents: 3599,
    date: DateTime(2025, 7, 10),
    description: 'Weekly groceries',
    category: 'Food',
  );

  final expense2 = Expense(
    id: '002',
    amountCents: 1499,
    date: DateTime(2025, 7, 12),
    description: 'Coffee',
    category: 'Beverage',
  );

  final expense3 = Expense(
    id: '003',
    amountCents: 1899,
    date: DateTime(2025, 7, 11),
    description: 'Pizza',
    category: 'Food',
  );

  manager.addExpense(expense1);
  manager.addExpense(expense2);
  manager.addExpense(expense3);

  final expenses = manager.getAllExpenses();

  for (var expense in expenses) {
    print(expense);
  }

  runApp(
    // This sets up the material design system, highly recommended
    MaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      // Blueprint for a screen; provides predefined slots(appBar, body)
      home: Scaffold(
        appBar: AppBar(title: Text('Expense Tracker')),
        body: Center(child: Text('App is starting...')),
      ),
    ),
  );
}
