import 'package:covinfo/provider/nav_provider.dart';
import 'package:covinfo/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String date = '';
  String week = '';

  @override
  void initState() {
    getDate();
    super.initState();
  }

  getDate() {
    var data = DateTime.now();
    var month = data.month;
    var day = data.day;
    var year = data.year;
    var weekDay = data.weekday;
    week = getWeek(weekDay);
    date = '$day ${getMonthString(month)} ${year}';
  }

  getMonthString(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';

      default:
        'jan';
    }
  }

  getWeek(int week) {
    switch (week) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        'Week';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/icons/menu.png',
                color: kText,
                // height: 30,
                width: 40,
              ),
              Text(
                "$week, $date",
                style: TextStyle(
                  color: kText,
                  fontSize: 11,
                ),
              )
            ],
          ),
        ),
      ),
      body: Consumer<NavProvider>(
        builder: (context, value, _) {
          return value.pages[value.tabSelected];
        },
      ),
      bottomNavigationBar: Consumer<NavProvider>(builder: (context, value, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              navIcon(
                onTap: () {
                  value.selectTab(0);
                },
                image: 'assets/icons/bar.png',
                gradient: (value.tabSelected == 0)
                    ? btn
                    : LinearGradient(colors: [kPrimary, kPrimary]),
                iColor: (value.tabSelected == 0) ? Colors.white : kText,
              ),
              navIcon(
                onTap: () {
                  value.selectTab(1);
                },
                image: 'assets/icons/medicine.png',
                gradient: (value.tabSelected == 1)
                    ? btn
                    : LinearGradient(colors: [kPrimary, kPrimary]),
                iColor: (value.tabSelected == 1) ? Colors.white : kText,
              ),
              navIcon(
                onTap: () {
                  value.selectTab(2);
                },
                image: 'assets/icons/news.png',
                gradient: (value.tabSelected == 2)
                    ? btn
                    : LinearGradient(colors: [kPrimary, kPrimary]),
                iColor: (value.tabSelected == 2) ? Colors.white : kText,
              ),
              navIcon(
                onTap: () {
                  value.selectTab(3);
                },
                image: 'assets/icons/test.png',
                gradient: (value.tabSelected == 3)
                    ? btn
                    : LinearGradient(colors: [kPrimary, kPrimary]),
                iColor: (value.tabSelected == 3) ? Colors.white : kText,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget navIcon(
      {required void Function() onTap,
      required String image,
      Gradient? gradient,
      required Color iColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(-3, -3),
              color: Colors.white.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 0.2,
            ),
            BoxShadow(
              offset: Offset(6, 6),
              color: Colors.black.withOpacity(0.8),
              blurRadius: 16,
            ),
          ],
        ),
        child: Image.asset(
          image,
          color: iColor,
          fit: BoxFit.cover,
        ),
        height: 70,
      ),
    );
  }
}
