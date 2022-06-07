// ignore_for_file: sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:bepo/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BePo'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            child: const Card(
              elevation: 5,
              color: Colors.green,
              child: Text('CHART'),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 248, 242, 213),
                          border: Border.all(color: Colors.black, width: 1.25),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                        ),
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'R\$ ${tx.amount}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color.fromARGB(255, 6, 92, 104),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat('H:mm - E dd/MM/y').format(tx.date),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
