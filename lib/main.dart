import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() {
  runApp(
    ExpenseTracker(),
  );
}

class ExpenseTracker extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      amount: 150.50,
      dateTime: DateTime.now(),
      id: '1',
      title: 'Groceries',
    ),
    Transaction(
      amount: 2250,
      dateTime: DateTime.now(),
      id: '2',
      title: 'Rent',
    ),
  ];
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
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '₹ ${tx.amount}',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.dateTime),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
