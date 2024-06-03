import 'package:flutter/material.dart';

import '../values/app_values.dart';

class CustomRefreshHeader extends StatelessWidget {
  const CustomRefreshHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppValues.padding),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_downward,
            color: Colors.grey,
          ),
          SizedBox(width: 15),
          Text(
            'Tarik ke bawah untuk memuat ulang',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
