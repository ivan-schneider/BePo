// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function newTx;

  NewTransaction(this.newTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Descrição'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Valor'),
              controller: amountController,
            ),
            ElevatedButton(
              onPressed: () {
                newTx(
                    titleController.text, double.parse(amountController.text));
              },
              child: const Text('Nova Transação'),
            ),
          ],
        ),
      ),
    );
  }
}
