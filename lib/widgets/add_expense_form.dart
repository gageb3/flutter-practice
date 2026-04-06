import 'package:flutter/material.dart';

class AddExpenseForm extends StatelessWidget {
  const AddExpenseForm({super.key, required this.onAddExpense});

  final void Function(String name, String amount, String category) onAddExpense;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();
    final categoryController = TextEditingController();

    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Expense Name'),
        ),
        TextFormField(
          controller: amountController,
          decoration: const InputDecoration(labelText: 'Amount'),
        ),
        TextFormField(
          controller: categoryController,
          decoration: const InputDecoration(labelText: 'Category'),
        ),
        ElevatedButton(
          onPressed: () {
            onAddExpense(
              nameController.text,
              amountController.text,
              categoryController.text,
            );

            nameController.clear();
            amountController.clear();
            categoryController.clear();
          },
          child: const Text('Add Expense'),
        ),
      ],
    );
  }
}
