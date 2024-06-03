class WasteProcessingDailyReport {
  final DateTime date;
  final int totalWasteReceived;
  final int totalWasteProcessed;
  final int wasteReceivedIncreasePercent;
  final int wasteProcessedIncreasePercent;

  WasteProcessingDailyReport({
    required this.date,
    required this.totalWasteReceived,
    required this.totalWasteProcessed,
    required this.wasteReceivedIncreasePercent,
    required this.wasteProcessedIncreasePercent,
  });
}
