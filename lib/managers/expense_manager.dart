import 'package:expense_tracker/models/expense.dart';

class ExpenseManager {
  // private field that holds expense objects
  final List<Expense> _expenses = [];

  // Constructor
  ExpenseManager();

  // public methods...
  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  List<Expense> getAllExpenses() {
    return List.unmodifiable(_expenses);
  }

  int getTotalExpenses() {
    int totalExpenses = 0;

    for (var expense in _expenses) {
      totalExpenses += expense.amountCents;
    }
    return totalExpenses;
  }

  // Manual loop version
  List<Expense> getExpensesByCategoryLoop(String category) {
    List<Expense> categoryList = [];

    for (var expense in _expenses) {
      if (expense.category == category) {
        categoryList.add(expense);
      }
    }
    return categoryList;
  }

  // where()
  // Return a new list of expenses from _expenses where each expense's category equals the category passed into the method.
  List<Expense> getExpensesByCategory(String category) {
    return _expenses.where((expense) => expense.category == category).toList();
  }

  List<Expense> getExpensesSortedByDate() {
    // Creates a new list so the original _expenses order is not changed
    final sortedExpenses = List<Expense>.from(_expenses);
    // Sort the expenses by comparing two items at a time and place the one with the later date first.
    sortedExpenses.sort((a, b) => b.date.compareTo(a.date));

    return sortedExpenses;
  }

  // method that calculates total spending per category
  Map<String, int> getTotalFromCategory() {
    // Map that stores category, total cents spent
    final Map<String, int> totals = {};

    for (var expense in _expenses) {
      // Get the category, if null, use "uncategorized"
      final category = expense.category ?? "uncategorized";

      // if category has not been added to the map yet, create entry starting at 0 cents
      if (!totals.containsKey(category)) {
        totals[category] = 0;
      }
      // Take the current total for this category, add this expense amount, and store the new total back into the map.
      totals[category] = totals[category]! + expense.amountCents;
    }
    return totals;
  }

  // Look through the list, find the largest one, return it
  Expense? getLargestExpense() {
    if (_expenses.isEmpty) {
      return null;
    }

    Expense largestExpense = _expenses.first;

    for (var expense in _expenses) {
      if (expense.amountCents > largestExpense.amountCents) {
        largestExpense = expense;
      }
    }
    return largestExpense;
  }

  // Look through the list, find the smallest one, return it
  Expense? getSmallestExpense() {
    if (_expenses.isEmpty) {
      return null;
    }
    Expense smallestExpense = _expenses.first;

    for (var expense in _expenses) {
      if (expense.amountCents < smallestExpense.amountCents) {
        smallestExpense = expense;
      }
    }
    return smallestExpense;
  }

  // Create method that returns all expenses in a specific month
  List<Expense> getMonthlyExpenses(int year, int month) {
    List<Expense> monthlyExpenses = [];

    for (var expense in _expenses) {
      if (expense.date.year == year && expense.date.month == month) {
        monthlyExpenses.add(expense);
      }
    }
    return monthlyExpenses;
  }

  // Method that receives year and month parameters
  int getTotalForMonth(int year, int month) {
    // calls getMonthlyExpenses to retrieve only the expenses that match that month.
    List<Expense> monthlyExpenses = getMonthlyExpenses(year, month);
    int total = 0;
    for (var expense in monthlyExpenses) {
      total += expense.amountCents;
    }
    return total;
  }

  // Gives total amount spent for a category in the month.
  int getTotalForCategoryInMonth(int year, int month, String category) {
    int total = 0;
    for (var expense in _expenses) {
      if (expense.date.year == year &&
          expense.date.month == month &&
          expense.category == category) {
        total += expense.amountCents;
      }
    }
    return total;
  }

  // Created a sorted list of expenses by amount
  List<Expense> getExpensesSortedByAmount() {
    List<Expense> sortedExpenses = List.from(_expenses);
    // sort() without a comparator only works for types that implement Comparable
    sortedExpenses.sort((a, b) => b.amountCents.compareTo(a.amountCents));
    return sortedExpenses;
  }

  // Create a method that returns new list of expenses sorted by date
  // {} is a named parameter; indicates the parameter is optional
  List<Expense> getDateExpensesSorted({bool newestFirst = true}) {
    List<Expense> sortedDateExpenses = List.from(_expenses);
    if (newestFirst) {
      sortedDateExpenses.sort((a, b) => a.date.compareTo(b.date));
    } else {
      sortedDateExpenses.sort((a, b) => b.date.compareTo(a.date));
    }
    return sortedDateExpenses;
  }

  // Method that takes all _expenses, groups them by year and month, returns a data structure that makes it easy to see totals/lists per month
  Map<String, List<Expense>> groupExpensesByMonth() {
    // create empty map
    Map<String, List<Expense>> monthlyGroups = {};
    for (var expense in _expenses) {
      String key = "${expense.date.year}-${expense.date.month}";

      if (!monthlyGroups.containsKey(key)) {
        monthlyGroups[key] = [];
      }
      monthlyGroups[key]!.add(expense);
    }
    return monthlyGroups;
  }
}
