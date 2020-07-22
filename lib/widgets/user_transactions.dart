import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_list.dart';
import './new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
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

  void addTransaction(String txTitle, double txAmount) {
    String newTransactionId = _transactions.length.toString();
    setState(() {
      _transactions.add(Transaction(
          id: newTransactionId,
          title: txTitle,
          amount: txAmount,
          dateTime: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addTransaction,
        ),
        TransactionList(
          _transactions,
        ),
      ],
    );
  }
}
