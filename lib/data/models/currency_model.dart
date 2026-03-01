class CurrencyModel {
  final String code;
  final String name;

  CurrencyModel({
    required this.code,
    required this.name,
  });

  factory CurrencyModel.fromMap(MapEntry<String, dynamic> entry) {
    return CurrencyModel(
      code: entry.key,
      name: entry.value,
    );
  }
}