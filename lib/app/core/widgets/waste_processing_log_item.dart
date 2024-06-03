import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../data/models/waste_processing_daily_report_model.dart';
import '../utils/helpers.dart';

class WasteProcessingLogItem extends StatelessWidget {
  const WasteProcessingLogItem({
    super.key,
    required this.isLastItem,
    required this.data,
  });

  final bool isLastItem;
  final WasteProcessingDailyReport data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFEEF3F8)),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x07151A47),
            blurRadius: 16,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: const Color(0xFFEEF6FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Icon(
                  IconlyBold.download,
                  color: Color(0xff1D69C2),
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sampah Masuk',
                      style: TextStyle(
                        color: Color(0xFF090A0A),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    data.wasteReceivedIncreasePercent > 0 && !isLastItem
                        ? Text(
                            '+${data.wasteReceivedIncreasePercent}% dari kemarin',
                            style: const TextStyle(
                              color: Color(0xff1D69C2),
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : data.wasteReceivedIncreasePercent < 0 && !isLastItem
                            ? Text(
                                '${data.wasteReceivedIncreasePercent}% dari kemarin',
                                style: const TextStyle(
                                  color: Color(0xffF92814),
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            : const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF3F8FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
                child: SizedBox(
                  width: 48,
                  child: Text(
                    Helpers.formatGramToKg(
                      data.totalWasteReceived,
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF001C35),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            color: Color(0xFFEEF3F8),
            thickness: 1,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: const Color(0xFFEEF6FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Icon(
                  IconlyBold.setting,
                  color: Color(0xff20D3C4),
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sampah Terolah',
                      style: TextStyle(
                        color: Color(0xFF090A0A),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    data.wasteProcessedIncreasePercent > 0 && !isLastItem
                        ? Text(
                            '+${data.wasteProcessedIncreasePercent}% dari kemarin',
                            style: const TextStyle(
                              color: Color(0xFF34D2C5),
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : data.wasteProcessedIncreasePercent < 0 && !isLastItem
                            ? Text(
                                '${data.wasteProcessedIncreasePercent}% dari kemarin',
                                style: const TextStyle(
                                  color: Color(0xffF92814),
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            : const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF3F8FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
                child: SizedBox(
                  width: 48,
                  child: Text(
                    Helpers.formatGramToKg(
                      data.totalWasteProcessed,
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF001C35),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
