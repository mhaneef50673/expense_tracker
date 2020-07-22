import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

void main() {
  runApp(
    ExpenseTracker(),
  );
}

class ExpenseTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Expense Tracker',
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Card(
                child: Text('CHART'),
                color: Colors.blue,
                elevation: 5,
              ),
              width: double.infinity,
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
