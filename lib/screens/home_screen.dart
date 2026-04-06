import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../models/expense_result.dart';
import '../services/expense_manager.dart';
import '../widgets/filter_section.dart';
import '../widgets/add_expense_form.dart';
import '../widgets/results_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ExpenseManager manager = ExpenseManager();

  double minAmount = 0.0;
  String keyword = '';
  String category = '';

  ExpenseResult result = ExpenseResult(expenses: [], total: 0);

  @override
  void initState() {
    super.initState();
    _updateResult();
  }

  void _updateResult() {
    final filtered = manager.getFilteredExpenses(minAmount, keyword, category);
    final total = manager.getTotal(filtered);
    setState(() {
      result = ExpenseResult(expenses: filtered, total: total);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expense Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FilterSection(
              onKeywordChanged: (value) {
                keyword = value;
                _updateResult();
              },
              onMinAmountChanged: (value) {
                minAmount = double.tryParse(value) ?? 0.0;
                _updateResult();
              },
              onCategoryChanged: (value) {
                category = value;
                _updateResult();
              },
            ),
            const SizedBox(height: 10),
            AddExpenseForm(
              onAddExpense: (name, amountText, categoryText) {
                final amount = double.tryParse(amountText);
                if (amount == null || name.isEmpty || categoryText.isEmpty)
                  return;

                manager.addExpense(
                  Expense(name: name, amount: amount, category: categoryText),
                );
                _updateResult();
              },
            ),
            Expanded(child: ResultsSectionWrapper(result: result)),
          ],
        ),
      ),
    );
  }
}
