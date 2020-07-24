import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  Chart(this._recentTransactions);

  List<Map<String, Object>> get getGroupedChartData {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (int i = 0; i < _recentTransactions.length; i++) {
        if (weekDay.day == _recentTransactions[i].dateTime.day &&
            weekDay.month == _recentTransactions[i].dateTime.month &&
            weekDay.year == _recentTransactions[i].dateTime.year) {
          totalSum += _recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return getGroupedChartData.fold(
        0.0, (sum, element) => sum += element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: getGroupedChartData.map((data) {
          return ChartBar(
              data['day'],
              data['amount'],
              totalSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
