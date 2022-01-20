// import 'dart:convert';

// import 'package:covinfo/model/model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CovidInfo with ChangeNotifier {
//   Future<bool> getData() async {
//     covidData.clear();
//     String url1 =
//         'https://corona.lmao.ninja/v2/countries/India?yesterday&strict&query';
//     // String url2 = 'https://api.rootnet.in/covid19-in/stats/latest';
//     var response = await http.get(
//       Uri.parse(
//         url1,
//       ),
//     );
//     if (response.statusCode == 200) {
//       try {
//         var data = response.body;
//         var decodeData = jsonDecode(data);
//         covidData = List.from(decodeData)
//             .map<Model>((item) => Model.fromJson(item))
//             .toList();
//         notifyListeners();
//         if (covidData.isNotEmpty) {
//           return Future.value(true);
//         } else {
//           return Future.value(false);
//         }
//       } catch (e) {
//         return Future.value(false);
//       }
//     } else {
//       return Future.value(false);
//     }
//   }
// }
