import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:expense_repository/expense_repository.dart';
// import 'package:path/path.dart' as path;

class PDFExportService {
  Future<File> generateExpenseReport(List<Expense> expenses) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Expense Report',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Table.fromTextArray(
                  headers: ['Date', 'Category', 'Amount'],
                  data: expenses.map((expense) {
                    return [
                      expense.date.toString(),
                      expense.category.name,
                      expense.amount.toString(),
                    ];
                  }).toList(),
                  border: pw.TableBorder.all(),
                  cellAlignment: pw.Alignment.center,
                  headerStyle: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blue,
                  ),
                  cellStyle: const pw.TextStyle(fontSize: 12),
                  cellHeight: 30,
                  headerDecoration:
                      const pw.BoxDecoration(color: PdfColors.grey300),
                ),
              ]);
        },
      ),
    );
    // Test writing to the custom directory
    // const customFilePath = 'D:/expense_tracker_flutter/expense_report.pdf';

     try {
      // Get the Documents directory for the emulator
      final directory = await getApplicationDocumentsDirectory();

      // Define the file path
      final filePath = '${directory.path}/expense_report.pdf';
      final file = File(filePath);

      // Save the PDF file
      await file.writeAsBytes(await pdf.save());
      print('PDF successfully saved to: $filePath');

      return file;
    } catch (e) {
      print('Failed to save PDF: $e');
      throw Exception('Error saving PDF');
    }
  }
}



