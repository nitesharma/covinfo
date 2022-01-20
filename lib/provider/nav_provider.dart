import 'package:covinfo/pages/donate.dart';
import 'package:covinfo/pages/health.dart';
import 'package:covinfo/pages/info.dart';
import 'package:covinfo/pages/news/news_en.dart';
import 'package:covinfo/pages/symptoms.dart';
import 'package:flutter/material.dart';

class NavProvider with ChangeNotifier {
  int tabSelected = 0;
  int btnSelected = 0;
  int stepSelcted = 0;
  int risk = 0;

  List<Widget> pages = [
    Info(),
    Symptoms(),
    EnglishNews(),
    Donate(),
  ];

  selectTab(int tab) {
    tabSelected = tab;
    notifyListeners();
  }

  selectBtn(int tab) {
    btnSelected = tab;
    notifyListeners();
  }

  selectStep(int tab) {
    stepSelcted = tab;
    notifyListeners();
  }

  riskCount() {
    risk = risk + 1;
    print(risk);
    notifyListeners();
  }
}
