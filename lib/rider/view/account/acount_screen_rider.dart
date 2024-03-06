import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride/constant/utils/colors.dart';
import 'package:ride/constant/utils/textstyles.dart';
import 'package:sizer/sizer.dart';

class RiderAccountScreen extends StatefulWidget {
  const RiderAccountScreen({super.key});

  @override
  State<RiderAccountScreen> createState() => _RiderAccountScreenState();
}

class _RiderAccountScreenState extends State<RiderAccountScreen> {
  List accountTopButtons = [
    [CupertinoIcons.shield_fill, "Help"],
    [CupertinoIcons.creditcard_fill, "Payment"],
    [CupertinoIcons.square_list_fill, "Activity"],
  ];
  List accountButons = [
    [CupertinoIcons.gift_fill, "Send a gift"],
    [CupertinoIcons.gear_alt_fill, "Settings"],
    [CupertinoIcons.envelope, "Messages"],
    [CupertinoIcons.money_dollar_circle, "Earn by driving or delivering"],
    [CupertinoIcons.briefcase_fill, "Business hub"],
    [CupertinoIcons.person_2_fill, "Refer friends, unlock deals"],
    [CupertinoIcons.person_fill, "Manage user account"],
    [CupertinoIcons.power, "Logout"],
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //Top row details
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                //profile information
                Row(
                  children: [
                    // account name
                    SizedBox(
                      width: 70.w,
                      child: Text(
                        "Mawuena Kuadey",
                        style: AppTextStyles.heading20Bold,
                      ),
                    ),
                    //account logo
                    Container(
                      height: 16.w,
                      width: 16.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: black87),
                        color: black,
                        image: const DecorationImage(
                          image: AssetImage(
                            "asssets/images/uberLogo/uber.png",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //account buttons
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: accountTopButtons
                      .map(
                        (e) => Container(
                          height: 10.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            color: greyShade3,
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                e[0],
                                size: 4.h,
                                color: black87,
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                e[1],
                                style: AppTextStyles.small10,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),

            Divider(
              color: greyShade2,
              thickness: 0.5.h,
            ),
            SizedBox(height: 2.h),
            // Second colum design
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: accountButons.length,
              itemBuilder: ((context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    children: [
                      Icon(
                        accountButons[index][0],
                        color: black,
                        size: 3.h,
                      ),
                      SizedBox(width: 7.w),
                      Text(
                        accountButons[index][1],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
