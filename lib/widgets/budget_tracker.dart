import 'package:flutter/material.dart';

class BudgetTracker extends StatelessWidget {
  final double totalExpenses;
  final double budget;
  const BudgetTracker({
    required this.totalExpenses,
    required this.budget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percentageSpent = (totalExpenses / budget) * 100;

    return Column(
      children: [
        // Budget Progress Bar
        LinearProgressIndicator(
          value: percentageSpent > 100 ? 1.0 : percentageSpent / 100,
          backgroundColor: Colors.grey.shade300,
          valueColor: AlwaysStoppedAnimation<Color>(
              percentageSpent > 100 ? Colors.red : Colors.green),
        ),
        const SizedBox(height: 10),
        Text(
          'Budget: Rs. ${budget.toString()}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'Total Expenses: Rs. ${totalExpenses.toString()}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'Remaining Budget: Rs. ${(budget - totalExpenses).toString()}',
          style: TextStyle(
              fontSize: 16,
              color: budget - totalExpenses < 0 ? Colors.red : Colors.green),
        ),
        const SizedBox(height: 20),
        // Show warning if budget is exceeded
        if (totalExpenses > budget)
          const Text(
            'You have exceeded your budget!',
            style: const TextStyle(color: Colors.red, fontSize: 18),
          )
        else
          const Text(
            'You are within your budget.',
            style: TextStyle(color: Colors.green, fontSize: 18),
          ),
      ],
    );
  }
}
