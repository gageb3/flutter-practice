// Set variables for use later
class Expense {
  final String id;
  final int amountCents;
  final DateTime date;
  final String? description;
  final String? category;

  const Expense({
    required this.id,
    required this.amountCents,
    required this.date,
    required this.description,
    required this.category,
  });

  // Converts output to a string
  @override
  String toString() {
    // toStringAsFixed = decimal point representation of number
    final dollars = (amountCents / 100).toStringAsFixed(2);
    final dateStr = date.toString().substring(0, 10); // 2025-07-10

    return '$dollars - $description (${category ?? "uncategorized"}) - $dateStr [id: $id]';
  }
}
