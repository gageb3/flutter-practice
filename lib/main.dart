import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class ExpenseManager {
  final List<Expense> _expenses = [
    Expense(name: 'Pizza', amount: 3.99),
    Expense(name: 'Sandwich', amount: 5.01),
    Expense(name: 'Steak', amount: 5.87),
    Expense(name: 'Chicken', amount: 2.99),
    Expense(name: 'Soda', amount: 2.99),
  ];

  List<Expense> getFilteredExpenses(double minAmount, String keyword) {
    List<Expense> filteredExpenses = [];

    for (var expense in _expenses) {
      if (expense.amount > minAmount &&
          (keyword.isEmpty || expense.name.contains(keyword))) {
        filteredExpenses.add(expense);
      }
    }

    return filteredExpenses;
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  double getTotal(List<Expense> expenses) {
    double total = 0;

    for (var expense in expenses) {
      total += expense.amount;
    }

    return total;
  }
}

class Expense {
  final String name;
  final double amount;

  const Expense({required this.name, required this.amount});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ExpenseManager manager = ExpenseManager();
  // controllers let you read what the user typed
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filteredExpenses = manager.getFilteredExpenses(4.0, '');
    final total = manager.getTotal(filteredExpenses);

    return Scaffold(
      appBar: AppBar(title: const Text("Expense Tracker")),
      body: Column(
        children: [
          Text('Total: \$$total'),

          ElevatedButton(
            onPressed: () {
              setState(() {
                manager.addExpense(Expense(name: 'Coffee', amount: 4.50));
              });
            },
            child: const Text('Add Expense'),
          ),

          Expanded(
            child: ListView(
              children: filteredExpenses.map((expense) {
                return Text('${expense.name} - \$${expense.amount}');
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
