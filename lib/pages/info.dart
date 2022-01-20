import 'dart:convert';

import 'package:covinfo/model/model.dart';
import 'package:covinfo/provider/nav_provider.dart';
import 'package:covinfo/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  Model? covidData;

  Future<bool> getData() async {
    String url1 =
        'https://corona.lmao.ninja/v2/countries/India?yesterday&strict&query';
    // String url2 = 'https://api.rootnet.in/covid19-in/stats/latest';
    var response = await http.get(
      Uri.parse(
        url1,
      ),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      try {
        var data = response.body;
        var decodeData = jsonDecode(data);
        print(decodeData);

        covidData = Model(
          cases: decodeData['cases'],
          critical: decodeData['critical'],
          deaths: decodeData['deaths'],
          recovered: decodeData['recovered'],
        );

        if (covidData != null) {
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      } catch (e) {
        return Future.value(false);
      }
    } else {
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'COVINFO',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Typo Round',
                          color: kSecondry,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.black.withAlpha(20),
                    thickness: 6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  txtField(context),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCard(
                        context,
                        icon: 'assets/icons/virus.png',
                        total: covidData!.cases.toString(),
                        title: 'Cases',
                      ),
                      buildCard(
                        context,
                        icon: 'assets/icons/health.png',
                        total: covidData!.recovered.toString(),
                        title: 'Recovered',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCard(
                        context,
                        icon: 'assets/icons/grave.png',
                        total: covidData!.deaths.toString(),
                        title: 'Deaths',
                      ),
                      buildCard(
                        context,
                        icon: 'assets/icons/bed.png',
                        total: covidData!.critical.toString(),
                        title: 'Critical',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<NavProvider>(context, listen: false)
                          .selectTab(3);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kPrimary,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-2, -2),
                            color: kText.withOpacity(0.4),
                            blurRadius: 8,
                          ),
                          BoxShadow(
                              offset: Offset(6, 6),
                              color: Colors.black.withOpacity(0.8),
                              blurRadius: 16)
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Test Your Self",
                          style: TextStyle(
                            fontSize: 20,
                            color: kText,
                            fontFamily: 'Gotham Medium',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.shortestSide,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: kSecondry,
                      ))),
                ],
              );
            }
          }),
    );
  }

  Widget buildCard(
    BuildContext context, {
    required String icon,
    required String total,
    required String title,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2 - 30,
      height: MediaQuery.of(context).size.width / 2 - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kPrimary,
        boxShadow: [
          BoxShadow(
              offset: Offset(-2, -2),
              color: kText.withOpacity(0.4),
              blurRadius: 12),
          BoxShadow(
              offset: Offset(6, 6),
              color: Colors.black.withOpacity(0.8),
              blurRadius: 16)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                icon,
                height: 60,
                color: kSecondry,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    total,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Gotham Medium',
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: kText,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gotham Book',
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget txtField(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 6),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xff161D25),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        style: TextStyle(
          color: kSecondry,
          fontSize: 18,
          fontFamily: 'Gotham Book',
        ),
        // cursorColor: kPrimary,
        decoration: InputDecoration(
          fillColor: Color(0xff161D25),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.location_searching_rounded,
            color: kSecondry,
          ),
          hintText: "India",
          hintStyle: TextStyle(
            color: kSecondry,
            fontSize: 18,
            fontFamily: 'Gotham Book',
          ),
          suffixIcon: Icon(
            CupertinoIcons.search,
            size: 30,
            color: kSecondry,
          ),
        ),
      ),
    );
  }
}
