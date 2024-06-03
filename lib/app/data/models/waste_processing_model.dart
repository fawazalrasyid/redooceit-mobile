class WasteProcessing {
  final String id;
  final DateTime date;
  final int wasteReceived;
  final int wasteProcessed;

  WasteProcessing({
    required this.id,
    required this.date,
    required this.wasteReceived,
    required this.wasteProcessed,
  });

  WasteProcessing.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        date = DateTime.parse(json['date'] as String),
        wasteReceived = json['waste_received'] as int,
        wasteProcessed = json['waste_processed'] as int;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'waste_received': wasteReceived,
      'waste_processed': wasteProcessed,
    };
  }
}
