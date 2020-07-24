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
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '₹ ${_transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
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
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            _transactions[index].title,
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(_transactions[index].dateTime),
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
              },
            ),
    );
  }
}
