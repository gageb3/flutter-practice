import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
    required this.onKeywordChanged,
    required this.onMinAmountChanged,
    required this.onCategoryChanged,
  });

  final ValueChanged<String> onKeywordChanged;
  final ValueChanged<String> onMinAmountChanged;
  final ValueChanged<String> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Search by Name'),
          onChanged: onKeywordChanged,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'Minimum Amount'),
          keyboardType: TextInputType.number,
          onChanged: onMinAmountChanged,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'Filter Category'),
          onChanged: onCategoryChanged,
        ),
      ],
    );
  }
}
