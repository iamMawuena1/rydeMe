import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ride/constant/utils/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/utils/textstyles.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Activities',
          style: AppTextStyles.heading20Bold,
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 1.7.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: index == 0 ? transparent : greyShade3,
                  ),
                ),
              ),
              height: 11.4.h,
              width: 94.w,
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
                    height: 8.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: greyShadeButton,
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/vehicle/car.png",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "23, Gbiligbili St",
                          style: AppTextStyles.small12Bold,
                          maxLines: 2,
                        ),
                        Text(
                          DateFormat('dd MM, kk:mm a').format(
                            DateTime.now(),
                          ),
                          style: AppTextStyles.small10.copyWith(color: black87),
                        ),
                        Text(
                          "150.00",
                          style: AppTextStyles.small10.copyWith(color: black87),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
