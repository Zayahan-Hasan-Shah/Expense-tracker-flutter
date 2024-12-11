import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker_flutter/screens/stats/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/services/pdf_export_service.dart';

class StatScreen extends StatelessWidget {
  final List<Expense> expenses;
  // const StatScreen({super.key});
  const StatScreen({super.key, required this.expenses});

  Future<void> exportPDF(BuildContext context) async {
    final pdfService = PDFExportService();
    final pdfFile = await pdfService.generateExpenseReport(expenses);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF saved to ${pdfFile.path}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(expenses);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            const Text(
              "Transactions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(1, 1),
                      color: Colors.grey,
                      blurRadius: 0.45,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                child: MyChart(
                  expenses: expenses,
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () => exportPDF(context),
                child: const Text(
                  "Export to PDF",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
