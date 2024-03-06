import 'package:flutter/material.dart';
import 'package:ride/constant/utils/colors.dart';
import 'package:ride/constant/utils/textstyles.dart';
import 'package:sizer/sizer.dart';

class ServiceRideScreen extends StatefulWidget {
  const ServiceRideScreen({super.key});

  @override
  State<ServiceRideScreen> createState() => _ServiceRideScreenState();
}

class _ServiceRideScreenState extends State<ServiceRideScreen> {
  List firstRow = [
    [
      "assets/images/services/trip.png",
      "Trip",
    ],
    ["assets/images/services/rentals.png", "Rentals"],
  ];
  List secondRow = [
    [
      "assets/images/services/reserve.png",
      "Reserve",
    ],
    [
      "assets/images/services/intercity.png",
      "Intercity",
    ],
    [
      "assets/images/services/groupRide.png",
      "Group ride",
    ],
    ["assets/images/services/package.png", "Package,"],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Services",
          style: AppTextStyles.heading20Bold,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        children: [
          Text(
            'Go anywhere, get anything',
            style: AppTextStyles.body14Bold,
          ),
          SizedBox(height: 2.h),
          //first row section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: firstRow
                .map((e) => Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 1.h,
                        horizontal: 2.w,
                      ),
                      width: 44.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        color: greyShadeButton,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                              height: 8.h,
                              width: 8.h,
                              child: Image(
                                image: AssetImage(e[0]),
                                fit: BoxFit.cover,
                              )),
                          Text(
                            e[1],
                            style: AppTextStyles.small12,
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 2.h),
          // second row section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: secondRow
                .map(
                  (e) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 1.5.h,
                          horizontal: 2.w,
                        ),
                        width: 20.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: greyShadeButton,
                        ),
                        child: SizedBox(
                          height: 5.h,
                          width: 5.h,
                          child: Image(
                            image: AssetImage(e[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        e[1],
                        style: AppTextStyles.small10,
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
