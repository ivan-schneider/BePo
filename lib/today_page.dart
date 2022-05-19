import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 84, 116),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        DateFormat('dd / MM / yyyy').format(now),
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                        height: 15,
                        child: Text(
                          DateFormat('EEEE').format(now),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ))
                  ]),
            ),
            Container(
              height: 150,
              width: 360,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
              child: const Text('Container 1 - Data atual + Saldo'),
            ),
            Container(
                height: 150,
                width: 360,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: const Text('Container 2 - Gasto Total Diário')),
            Container(
                height: 150,
                width: 360,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: const Text('Container 3 - Gasto Total Mensal'))
          ],
        ),
      ),
    );
  }
}
