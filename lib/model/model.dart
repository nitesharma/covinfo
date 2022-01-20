class Model {
  int cases = 0;
  int deaths = 0;
  int recovered = 0;
  int critical = 0;

  Model({
    required this.cases,
    required this.critical,
    required this.deaths,
    required this.recovered,
  });

  Model.fromJson(Map<int, dynamic> map) {
    cases = map['cases'] ?? 0;
    deaths = map['deaths'] ?? 0;
    critical = map['critical'] ?? 0;
    recovered = map['recovered'] ?? 0;
  }
}
