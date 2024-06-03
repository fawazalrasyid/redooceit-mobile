import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:redooceit/app/routes/app_pages.dart';

import '../../data/models/member_model.dart';

class MemberItem extends StatelessWidget {
  final bool isLastItem;
  final Member data;

  const MemberItem({
    super.key,
    this.isLastItem = false,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: data.photoUrl,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(
                      color: Color(0xFF090A0A),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        data.phoneNumber,
                        style: const TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 12,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 1,
                        height: 14,
                        color: const Color(0xFFEEF3F8),
                      ),
                      Expanded(
                        child: Text(
                          data.address,
                          style: const TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () => Get.toNamed(
                Routes.MEMBER_PROFILE,
                arguments: data,
              ),
              icon: const Icon(
                IconlyLight.arrow_right_2,
                color: Color(0xFF000000),
                size: 20,
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
