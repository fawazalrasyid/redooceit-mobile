import 'member_model.dart';

class WasteDeposit {
  final String id;
  final String memberId;
  final DateTime date;
  final int weight;

  final Member? memberData;

  WasteDeposit({
    required this.id,
    required this.memberId,
    required this.date,
    required this.weight,
    this.memberData,
  });

  WasteDeposit.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        date = DateTime.parse(json['date'] as String),
        weight = json['weight'] as int? ?? 0,
        memberId = json['member_id'] as String,
        memberData = json['member_data'] != null
            ? Member.fromJson(
                json['member_data'] as Map<String, dynamic>,
              )
            : null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'weight': weight,
      'member_id': memberId,
      'member_data': memberData?.toJson(),
    };
  }
}
