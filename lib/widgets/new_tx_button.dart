// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransaction extends StatefulWidget {
  final Function newTx;
  const AddTransaction(this.newTx);

  @override
  State<AddTransaction> createState() => AddTransactionState();
}

class AddTransactionState extends State<AddTransaction> {
  bool _despesas = false;
  bool _credito = false;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _newTransaction() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return AlertDialog(
              title: const Text('Nova Transação'),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Despesas'),
                        Switch(
                          inactiveThumbColor: Colors.red,
                          inactiveTrackColor:
                              const Color.fromARGB(255, 209, 91, 83),
                          activeColor: Colors.green,
                          activeTrackColor:
                              const Color.fromARGB(255, 49, 141, 52),
                          value: _despesas,
                          onChanged: (newValue) {
                            setState(
                              () {
                                _despesas = newValue;
                              },
                            );
                          },
                        ),
                        const Text('Proventos'),
                      ],
                    ),
                    Visibility(
                      visible: !_despesas,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Débito'),
                          Switch(
                            inactiveThumbColor:
                                const Color.fromARGB(255, 255, 153, 0),
                            inactiveTrackColor:
                                const Color.fromARGB(255, 248, 193, 109),
                            activeColor:
                                const Color.fromARGB(255, 195, 58, 219),
                            activeTrackColor:
                                const Color.fromARGB(255, 192, 112, 206),
                            value: _credito,
                            onChanged: (newValue) {
                              setState(() {
                                _credito = newValue;
                              });
                            },
                          ),
                          const Text('Crédito'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            key: _formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp('[\\,]'))
                              ],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Valor',
                                hintText: '10.99',
                              ),
                              controller: amountController,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Insira um valor';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Descrição',
                            ),
                            controller: titleController,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.newTx(titleController.text,
                          double.parse(amountController.text));
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Salvar'),
                )
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _newTransaction,
      child: const Text('Nova Transação'),
    );
  }
}
