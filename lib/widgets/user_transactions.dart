// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:bepo/widgets/new_transaction.dart';
import 'package:bepo/widgets/transaction_list.dart';
import 'package:bepo/models/transaction.dart';
import 'package:bepo/widgets/new_tx_button.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Groceries',
      amount: 475.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Car',
      amount: 7499.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Barbecue',
      amount: 599.30,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
