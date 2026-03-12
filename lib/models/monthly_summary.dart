import 'package:expense_tracker/models/categories.dart';

class MonthlySummary {
  final int year;
  final int month;
  final int totalCents;
  final int expenseCount;
  final Map<Category, int> categoryTotals;

  MonthlySummary({
    required this.year,
    required this.month,
    required this.totalCents,
    required this.expenseCount,
    required this.categoryTotals,
  });

  @override
  String toString() {
    final buffer = StringBuffer();

    final totalDollars = totalCents / 100;

    buffer.writeln("Summary for $year-$month");
    buffer.writeln("Total Spent: \$${totalDollars.toStringAsFixed(2)}");
    buffer.writeln("Expenses: $expenseCount");
    buffer.writeln("");
    buffer.writeln("Category Totals:");

    categoryTotals.forEach((category, cents) {
      final dollars = cents / 100;
      buffer.writeln("${category.name}: \$${dollars.toStringAsFixed(2)}");
    });
    return buffer.toString();
  }
}
