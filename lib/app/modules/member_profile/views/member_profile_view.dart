import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:redooceit/app/core/widgets/custom_app_bar.dart';

import '../../../core/values/app_values.dart';
import '../../../core/widgets/custom_clip.dart';
import '../controllers/member_profile_controller.dart';

class MemberProfileView extends GetView<MemberProfileController> {
  const MemberProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 60,
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppValues.padding),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Icon(
                      IconlyLight.arrow_left_2,
                      size: 18,
                      color: Color(0xFF030319),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Detail Anggota',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const SizedBox(
                  width: 40,
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomClip(),
            child: Container(
              height: 64,
              color: const Color(0xFF001C35),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppValues.margin,
                ),
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFF2F6F7)),
                    borderRadius: BorderRadius.circular(8),
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
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          controller.member.photoUrl,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      controller.member.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF010005),
                        fontSize: 20,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          IconlyBold.calendar,
                          size: 16,
                          color: Color(0xFFFBA535),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Member Sejak ${DateFormat('d MMMM yyyy').format(controller.member.createdAt)}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF010005),
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF001C35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  padding: const EdgeInsets.all(6.40),
                                  decoration: ShapeDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment(-0.00, -1.00),
                                      end: Alignment(0, 1),
                                      colors: [
                                        Color(0xFF1F6ECB),
                                        Color(0xFF003667)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.40),
                                    ),
                                  ),
                                  child: const Icon(
                                    IconlyBold.download,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Terkumpul',
                                      style: TextStyle(
                                        color: Color(0xFFF3F8FA),
                                        fontSize: 12,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '${0} KG',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: 1,
                            height: 32,
                            color: const Color(0xFFFFFFFF).withOpacity(0.5),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  padding: const EdgeInsets.all(6.40),
                                  decoration: ShapeDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment(0.00, -1.00),
                                      end: Alignment(0, 1),
                                      colors: [
                                        Color(0xFF12CABA),
                                        Color(0xFF058076)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.40),
                                    ),
                                  ),
                                  child: const Icon(
                                    IconlyBold.setting,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Total Stamps',
                                      style: TextStyle(
                                        color: Color(0xFFF3F8FA),
                                        fontSize: 12,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '${controller.member.totalStamp}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconlyBold.star,
                            size: 18,
                            color: Color(0xFF20D3C4),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Penukaran Stamp',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF20D3C4),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
