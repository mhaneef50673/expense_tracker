import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: ExpenseTracker(),
    );
  }
}

class ExpenseTracker extends StatefulWidget {
  @override
  _ExpenseTrackerState createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Transaction> _transactions = [
    Transaction(
      amount: 15.50,
      dateTime: DateTime.now(),
      id: '1',
      title: 'Groceries',
    ),
    Transaction(
      amount: 20,
      dateTime: DateTime.now(),
      id: '2',
      title: 'Rent',
    ),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    String newTransactionId = (_transactions.length + 1).toString();
    setState(() {
      _transactions.add(Transaction(
          id: newTransactionId,
          title: txTitle,
          amount: txAmount,
          dateTime: DateTime.now()));
    });
  }

  void startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(
          _addTransaction,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () => startAddTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Card(
                child: Text('CHART'),
                color: Colors.blue,
                elevation: 5,
              ),
              width: double.infinity,
            ),
            TransactionList(
              _transactions,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
