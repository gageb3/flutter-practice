import '../models/expense.dart';

class ExpenseManager {
  final List<Expense> _expenses = [
    Expense(name: 'Pizza', amount: 3.99, category: 'Food'),
    Expense(name: 'Sandwich', amount: 5.01, category: 'Food'),
    Expense(name: 'Steak', amount: 5.87, category: 'Food'),
    Expense(name: 'Chicken', amount: 2.99, category: 'Food'),
    Expense(name: 'Soda', amount: 2.99, category: 'Beverage'),
  ];

  List<Expense> getFilteredExpenses(
    double minAmount,
    String keyword,
    String category,
  ) {
    final filteredExpenses = _expenses.where((expense) {
      final matchesAmount = expense.amount > minAmount;
      final matchesKeyword =
          keyword.isEmpty ||
          expense.name.toLowerCase().contains(keyword.toLowerCase());
      final matchesCategory =
          category.isEmpty ||
          expense.category.toLowerCase().contains(category.toLowerCase());

      return matchesAmount && matchesKeyword && matchesCategory;
    }).toList();

    filteredExpenses.sort((a, b) => b.amount.compareTo(a.amount));

    return filteredExpenses;
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  double getTotal(List<Expense> expenses) {
    return expenses.fold(0.0, (total, expense) => total + expense.amount);
  }
}
