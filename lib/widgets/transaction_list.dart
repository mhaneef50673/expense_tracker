import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No transactions to display',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.fill,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            '\$${_transactions[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      _transactions[index].title,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_transactions[index].dateTime),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
