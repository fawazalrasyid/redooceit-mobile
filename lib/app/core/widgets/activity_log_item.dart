import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:redooceit/app/routes/app_pages.dart';

import '../../data/models/activity_model.dart';

class ActivityLogItem extends StatelessWidget {
  const ActivityLogItem({
    super.key,
    required this.isLastItem,
    required this.data,
  });

  final bool isLastItem;
  final Activity data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        getactivityRoute(data.activityType),
        arguments: data,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: const Color(0xFF012F59),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.40),
                  ),
                ),
                child: Image.asset(
                  getActivityIcon(data.activityType),
                  width: 32,
                  height: 32,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        activityText(data.activityType),
                        Text(
                          DateFormat('HH:mm').format(data.date),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        activityDescText(data.activityType),
                        const Icon(
                          IconlyLight.arrow_right_2,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            color: Color(0xFFEEF3F8),
            thickness: 1,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  String getActivityIcon(String activityType) {
    switch (activityType) {
      case 'waste_processing':
        return 'assets/images/chat.png';
      case 'waste_deposit':
        return 'assets/images/user_info.png';
      case 'biopond_maggot':
        return 'assets/images/cart.png';
      default:
        return 'images/assets/chat.png';
    }
  }

  Widget activityText(String activityType) {
    switch (activityType) {
      case 'waste_processing':
        return const Text(
          'Catat Sampah',
          style: TextStyle(
            color: Color(0xFF094BB1),
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
          ),
        );
      case 'waste_deposit':
        return const Text(
          'Setoran Warga',
          style: TextStyle(
            color: Color(0xFFFF991A),
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
          ),
        );
      case 'biopond_maggot':
        return const Text(
          'Biopond Maggot',
          style: TextStyle(
            color: Color(0xFFE93535),
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
          ),
        );
      default:
        return Container();
    }
  }

  Widget activityDescText(String activityType) {
    switch (activityType) {
      case 'waste_processing':
        return const Text(
          'Jumlah harian diperbarui',
          style: TextStyle(
            color: Color(0xFF090A0A),
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
        );
      case 'waste_deposit':
        return Text(
          data.wasteDepositData?.memberData!.name ?? '',
          style: const TextStyle(
            color: Color(0xFF090A0A),
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
        );
      case 'biopond_maggot':
        return Text(
          data.activityDescription ?? '',
          style: const TextStyle(
            color: Color(0xFF090A0A),
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
        );
      default:
        return Container();
    }
  }

  String getactivityRoute(String activityType) {
    switch (data.activityType) {
      case 'waste_processing':
        return Routes.WASTE_PROCESSING;
      case 'waste_deposit':
        return Routes.WASTE_DEPOSIT;
      case 'biopond_maggot':
        return Routes.BIOPOND_MAGGOT;
      default:
        return Routes.MAIN;
    }
  }
}
