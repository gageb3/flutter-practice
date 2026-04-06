import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../screens/expense_details_screen.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection({
    super.key,
    required this.expenses,
    required this.total,
  });

  final List<Expense> expenses;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text('Total: \$$total'),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return ListTile(
                title: Text(expense.name),
                subtitle: Text(expense.category),
                trailing: Text('\$${expense.amount}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ExpenseDetailsScreen(expense: expense),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class ResultsSectionWrapper extends StatelessWidget {
  final dynamic result; // can be ExpenseResult type once imported

  const ResultsSectionWrapper({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return ResultsSection(expenses: result.expenses, total: result.total);
  }
}
