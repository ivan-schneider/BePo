import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();
final _textcontrollerVALOR = TextEditingController();
final _textcontrollerITEM = TextEditingController();
bool _despesa = true;

void _enterTransaction() {}

void novatransacao(context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return AlertDialog(
            title: const Text('Nova Transação'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Receita',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Switch(
                          inactiveTrackColor:
                              const Color.fromARGB(255, 7, 211, 7),
                          inactiveThumbColor:
                              const Color.fromARGB(255, 9, 150, 9),
                          activeTrackColor: Colors.red,
                          activeColor: const Color.fromARGB(255, 187, 25, 14),
                          value: _despesa,
                          onChanged: (newValue) {
                            setState(() => _despesa = newValue);
                          }),
                      const Text(
                        'Despesa',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Valor?',
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Entre com um valor!';
                              }
                              return null;
                            },
                            controller: _textcontrollerVALOR,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Descrição',
                          ),
                          controller: _textcontrollerITEM,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                  color: Colors.grey[600],
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              MaterialButton(
                  color: Colors.grey[600],
                  child: const Text('Enter',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _enterTransaction();
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          );
        });
      });
}
