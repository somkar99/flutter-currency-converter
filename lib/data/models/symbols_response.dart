class SymbolsResponse {
  final bool success;
  final Map<String, String> symbols;

  SymbolsResponse({
    required this.success,
    required this.symbols,
  });

  factory SymbolsResponse.fromJson(Map<String, dynamic> json) {
    return SymbolsResponse(
      success: json["success"],
      symbols: Map<String, String>.from(json["symbols"]),
    );
  }
}