import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:redooceit/app/core/utils/helpers.dart';
import 'package:redooceit/app/data/models/waste_deposit_model.dart';

class WasteDepositItem extends StatelessWidget {
  final bool isLastItem;
  final WasteDeposit data;

  const WasteDepositItem({
    super.key,
    this.isLastItem = false,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: data.memberData!.photoUrl,
              width: 40,
              height: 40,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Placeholder(),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                data.memberData!.name,
                style: const TextStyle(
                  color: Color(0xFF090A0A),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 12),
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
                  Helpers.formatGramToKg(data.weight),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF008176),
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
        if (!isLastItem)
          const Divider(
            color: Color(0xFFEEF3F8),
            thickness: 1,
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}
