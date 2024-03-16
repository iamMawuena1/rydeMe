import 'package:flutter/material.dart';
import 'package:ride/constant/utils/colors.dart';
import 'package:ride/constant/utils/textstyles.dart';
import 'package:sizer/sizer.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
            'or',
            style: AppTextStyles.small12.copyWith(
              color: grey,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: grey,
          ),
        ),
      ],
    );
  }
}
