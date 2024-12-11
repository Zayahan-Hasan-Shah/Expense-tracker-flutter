import 'dart:math';

import 'package:expense_repository/expense_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  final List<Expense> expenses;
  // const MyChart({super.key});
  const MyChart({super.key, required this.expenses});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y, String categoryName) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            transform: const GradientRotation(pi / 40),
          ),
          width: 10,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }

  // List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
  //       switch (i) {
  //         case 0:
  //           return makeGroupData(0, 2);
  //         case 1:
  //           return makeGroupData(1, 3);
  //         case 2:
  //           return makeGroupData(2, 2);
  //         case 3:
  //           return makeGroupData(3, 4.5);
  //         case 4:
  //           return makeGroupData(4, 3.8);
  //         case 5:
  //           return makeGroupData(5, 1.5);
  //         case 6:
  //           return makeGroupData(6, 4);
  //         case 7:
  //           return makeGroupData(7, 3.8);
  //         default:
  //           return throw Error();
  //       }
  //     });

  List<BarChartGroupData> showingGroups() {
    return widget.expenses.asMap().entries.map((entry) {
      int index = entry.key;
      Expense expense = entry.value;
      return makeGroupData(index, expense.amount.toDouble(), expense.category.name);
    }).toList();
  }

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getTiles,
          ),
          axisNameWidget: const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'Categories', // Set the title for the x-axis
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: leftTitles,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  Widget getTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 12,
      overflow: TextOverflow.ellipsis,
    );

    // Widget text;

    // switch (value.toInt()) {
    //   case 0:
    //     text = const Text("01", style: style);
    //     break;
    //   case 1:
    //     text = const Text("02", style: style);
    //     break;
    //   case 2:
    //     text = const Text("03", style: style);
    //     break;
    //   case 3:
    //     text = const Text("04", style: style);
    //     break;
    //   case 4:
    //     text = const Text("05", style: style);
    //     break;
    //   case 5:
    //     text = const Text("06", style: style);
    //     break;
    //   case 6:
    //     text = const Text("07", style: style);
    //     break;
    //   case 7:
    //     text = const Text("08", style: style);
    //     break;
    //   default:
    //     text = const Text("", style: style);
    //     break;
    // }
    // return SideTitleWidget(
    //   space: 16,
    //   axisSide: meta.axisSide,
    //   child: text,
    // );

    // int index = value.toInt();
    // String label = "Day ${(index + 1).toString()}";
    // String label = "Day ${(index + 1)}";
    // String label = "";
    // Get the category name for the current index

    // Widget text =
    //     Text('${(value + 1).toInt().toString().padLeft(2, '0')}', style: style);
    
    String categoryName = widget.expenses[value.toInt()].category.name;
    
    return SideTitleWidget(
      space: 8,
      axisSide: meta.axisSide,
      
      child: Text(
        categoryName,
        style: style,
      ),
    );
  }

  // Widget leftTitles(double value, TitleMeta meta) {
  //   const style = TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontSize: 14,
  //     color: Colors.grey,
  //   );
  //   String text;
  //   if (value == 0) {
  //     text = '2K';
  //   } else if (value == 2) {
  //     text = '3K';
  //   } else if (value == 3) {
  //     text = '3K';
  //   } else if (value == 4) {
  //     text = '4K';
  //   } else if (value == 5) {
  //     text = '5K';
  //   } else {
  //     return Container();
  //   }

  //   return SideTitleWidget(
  //     space: 0,
  //     axisSide: meta.axisSide,
  //     child: Text(text, style: style),
  //   );
  // }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Colors.grey,
    );
    // String text = '${(value * 1000).toInt()}K'; // Customize as needed
    String text = '${(value).toInt()}';

    return SideTitleWidget(
      space: 0,
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }
}
