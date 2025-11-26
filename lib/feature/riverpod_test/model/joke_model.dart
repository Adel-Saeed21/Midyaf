class JokeModel {
  final String setup;
  final String punchline;

  JokeModel({required this.setup, required this.punchline});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      setup: json['setup'] as String,
      punchline: json['punchline'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'setup': setup, 'puchline': punchline};
  }
}
