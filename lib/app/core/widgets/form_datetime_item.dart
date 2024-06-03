import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../values/app_colors.dart';

class FormDatetimeItem extends StatelessWidget {
  const FormDatetimeItem({
    super.key,
    required this.controller,
    required this.label,
    required this.hintLabel,
    required this.isRequired,
    required this.selectedValue,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final String hintLabel;
  final bool isRequired;
  final String selectedValue;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            children: [
              TextSpan(
                text: label,
                style: const TextStyle(
                  color: Color(0xFF0E132E),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isRequired)
                const TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Color(0xFFE94B3D),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DateTimePicker(
          type: DateTimePickerType.date,
          // controller: controller.startDateCtrl,
          // onChanged: (text) => controller.checkIsValidForm(),
          dateMask: 'dd MMMM yy',
          initialValue: DateTime.now().toString(),
          firstDate: DateTime(DateTime.now().year),
          lastDate: DateTime(2100),
          decoration: InputDecoration(
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.textFieldBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.textFieldBorder,
              ),
            ),
            border: InputBorder.none,
            hintText: hintLabel,
            hintStyle: const TextStyle(
              color: AppColors.textFieldHint,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: const IconButton(
              onPressed: null,
              icon: Icon(
                IconlyBold.calendar,
                size: 16,
                color: Color(0xff105997),
              ),
            ),
            contentPadding: const EdgeInsets.all(14),
          ),
        ),
      ],
    );
  }
}
