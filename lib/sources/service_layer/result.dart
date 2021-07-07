class Result {
  final String access;

  Result({
    required this.access,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      access: json['result']['access'],
    );
  }
}
