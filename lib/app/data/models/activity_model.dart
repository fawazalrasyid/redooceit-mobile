import 'package:redooceit/app/data/models/biopond_maggot_model.dart';
import 'package:redooceit/app/data/models/waste_deposit_model.dart';
import 'package:redooceit/app/data/models/waste_processing_model.dart';

class Activity {
  final String id;
  final String userId;
  final String tpsId;
  final String activityType;
  final String? activityDescription;
  final String actyvityDetailId;
  final DateTime date;

  final WasteDeposit? wasteDepositData;
  final WasteProcessing? wasteProcessingData;
  final BiopondMaggot? biopondMaggotData;

  Activity({
    required this.id,
    required this.userId,
    required this.tpsId,
    required this.activityType,
    this.activityDescription,
    required this.actyvityDetailId,
    required this.date,
    this.wasteDepositData,
    this.wasteProcessingData,
    this.biopondMaggotData,
  });

  Activity.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        userId = json['user_id'] as String,
        tpsId = json['tps_id'] as String,
        activityType = json['activity_type'] as String,
        activityDescription = json['activity_description'] != null
            ? json['activity_description'] as String
            : '',
        actyvityDetailId = json['activity_detail_id'] as String,
        date = DateTime.parse(json['date'] as String),
        wasteDepositData = json['waste_deposit_data'] != null
            ? WasteDeposit.fromJson(
                json['waste_deposit_data'] as Map<String, dynamic>,
              )
            : null,
        wasteProcessingData = json['waste_processing_data'] != null
            ? WasteProcessing.fromJson(
                json['waste_processing_data'] as Map<String, dynamic>,
              )
            : null,
        biopondMaggotData = json['biopond_maggot_data'] != null
            ? BiopondMaggot.fromJson(
                json['biopond_maggot_data'] as Map<String, dynamic>,
              )
            : null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'tps_id': tpsId,
      'activity_type': activityType,
      'actyvity_description': activityDescription,
      'activity_detail_id': actyvityDetailId,
      'date': date.toIso8601String(),
      'waste_deposit_data': wasteDepositData?.toJson(),
      'waste_processing_data': wasteProcessingData?.toJson(),
      'biopond_maggot_data': biopondMaggotData?.toJson(),
    };
  }
}
