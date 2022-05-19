import 'package:flutter/material.dart';
import 'package:bepo/today_page.dart';
import 'package:bepo/month_page.dart';
import 'package:bepo/year_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 84, 116),
        appBar: AppBar(
          toolbarHeight: 55,
          backgroundColor: Colors.amber,
          title: const Text('BePo'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              SizedBox(
                height: 65,
                child:
                    Tab(text: 'Hoje', icon: Icon(Icons.calendar_today_rounded)),
              ),
              SizedBox(
                height: 50,
                child: Tab(
                    text: 'Mensal', icon: Icon(Icons.calendar_month_rounded)),
              ),
              SizedBox(
                height: 50,
                child:
                    Tab(text: 'Ano', icon: Icon(Icons.edit_calendar_rounded)),
              )
            ],
          ),
        ),
        body: const TabBarView(children: [
          TodayPage(),
          MonthPage(),
          YearPage(),
        ]),
      ),
    );
  }
}
