import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:ride/common/controller/authprovider.dart';
import 'package:ride/common/widget/elevatedbutton.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/utils/colors.dart';
import '../../../constant/utils/textstyles.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  //timer variable
  int num = 60;
  //otp controller
  TextEditingController otpController = TextEditingController();
  //otp error controller
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  // otp timer function
  void decreaseNum() {
    if (num > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          num = num - 1;
        });
        decreaseNum();
      });
    }
  }

  //initializer to the timer countdown
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      decreaseNum();
    });
  }

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButtonCommon(
                onPressed: () {},
                backgroundColor: white,
                borderRadius: 50.sp,
                height: 6.h,
                width: 6.h,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                ),
              ),
              ElevatedButtonCommon(
                onPressed: () {},
                backgroundColor: white,
                borderRadius: 50.sp,
                height: 6.h,
                width: 6.h,
                child: Row(
                  children: [
                    Text(
                      'Continue',
                      style: AppTextStyles.small12,
                    ),
                    SizedBox(width: 2.w),
                    Icon(
                      Icons.arrow_forward,
                      color: black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          children: [
            Text(
              'Welcome',
              style: AppTextStyles.body18,
            ),
            SizedBox(height: 2.h),
            Text(
              'Enter the 6 digits code sent to you at ${context.read<MobileAuthProvider>().mobileNumber}',
              style: AppTextStyles.small10,
            ),
            SizedBox(height: 4.h),
            PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              textStyle: AppTextStyles.body14,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5.sp),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: white,
                inactiveColor: greyShade3,
                inactiveFillColor: greyShade3,
                selectedFillColor: white,
                selectedColor: black,
                activeColor: black,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: transparent,
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: otpController,
              onCompleted: (value) {},
              onChanged: (value) {},
              beforeTextPaste: (text) {
                return true;
              },
            ),
            SizedBox(height: 3.h),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      color: greyShade3,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                    child: Text(
                      num > 0
                          ? 'I didn\'t recieve a code (00:$num)'
                          : 'I didn\'t receive a code',
                      style: AppTextStyles.small10.copyWith(
                        color: num > 1 ? black38 : black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
