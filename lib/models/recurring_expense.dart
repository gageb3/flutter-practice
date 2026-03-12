import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/categories.dart';

class RecurringExpense extends Expense {
  final Frequency frequency;
  final int occurrences;

  // ignore: use_super_parameters
  RecurringExpense({
    required this.frequency,
    required this.occurrences,
    required String id,
    required int amountCents,
    required DateTime date,
    required Category category,
    required String? description,
  }) : super(
         id: id,
         amountCents: amountCents,
         date: date,
         category: category,
         description: description,
       );

  // Method that produces the actual Expense objects for each occurrence
  List<Expense> generateInstances() {
    List<Expense> instances = [];
    DateTime currentDate = date;
    // Each iteration creates a new Expense object
    for (int i = 0; i < occurrences; i++) {
      instances.add(
        Expense(
          id: '$id-$i', // unique id for each occurrence
          amountCents: amountCents,
          date: currentDate,
          category: category,
          description: description,
        ),
      );
      // Update the date for the next occurrence
      switch (frequency) {
        case Frequency.daily:
          currentDate = currentDate.add(Duration(days: 1));
          break;
        case Frequency.weekly:
          currentDate = currentDate.add(Duration(days: 7));
          break;
        case Frequency.monthly:
          currentDate = DateTime(
            currentDate.year,
            currentDate.month + 1,
            currentDate.day,
          );
          break;
      }
    }
    return instances;
  }
}

// Ensures only valid frequencies are allowed
enum Frequency { daily, weekly, monthly }
