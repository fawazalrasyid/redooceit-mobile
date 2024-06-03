class BiopondMaggot {
  final String id;
  final DateTime startDate;
  final int maggotWeight;
  final int kasgotWeight;
  final int remainingFoodWeight;
  final String status;

  BiopondMaggot({
    required this.id,
    required this.startDate,
    required this.maggotWeight,
    required this.kasgotWeight,
    required this.remainingFoodWeight,
    required this.status,
  });

  BiopondMaggot.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        startDate = DateTime.parse(json['start_date'] as String),
        maggotWeight = json['maggot_weight'] as int,
        kasgotWeight = json['kasgot_weight'] as int,
        remainingFoodWeight = json['remaining_food_weight'] as int,
        status = json['status'] as String;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'start_date': startDate.toIso8601String(),
      'maggot_weight': maggotWeight,
      'kasgot_weight': kasgotWeight,
      'remaining_food_weight': remainingFoodWeight,
      'status': status,
    };
  }
}
