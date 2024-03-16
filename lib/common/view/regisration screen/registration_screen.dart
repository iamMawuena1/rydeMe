import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ride/common/widget/elevatedbutton.dart';
import 'package:ride/constant/utils/colors.dart';
import 'package:ride/constant/utils/textstyles.dart';
import 'package:sizer/sizer.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController vehicleModelNameController = TextEditingController();
  TextEditingController vehicleBrandNameController = TextEditingController();
  TextEditingController vehicleRegistrationNumberController =
      TextEditingController();
  TextEditingController drivingLicenceNumberController =
      TextEditingController();

  String? selectedVehicleType;
  List<String> vehicleTypes = [
    'Select vehicle type',
    'Mini',
    'Sedan',
    'Suv',
    'Bike',
  ];
  String userType = 'Customer';
  File? profilePic;
  bool registerButtonPressed = false;

//controller initializer
  @override
  void initState() {
    super.initState();
    //mobileController.text = auth.current1.phoneNumber!;
    mobileController.text = "+233249000000";
  }

// controller disposer
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    vehicleModelNameController.dispose();
    vehicleBrandNameController.dispose();
    vehicleRegistrationNumberController.dispose();
    drivingLicenceNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          children: [
            SizedBox(height: 2.h),
            //circleavatar
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                radius: 8.h,
                backgroundColor: greyShade3,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Builder(
                    builder: ((context) {
                      if (profilePic != null) {
                        return CircleAvatar(
                          radius: 8.h - 2,
                          backgroundColor: white,
                          backgroundImage: FileImage(profilePic!),
                        );
                      } else {
                        return CircleAvatar(
                          radius: 8.h - 2,
                          backgroundColor: white,
                          child: const Image(
                            image: AssetImage(
                              "assets/images/uberLogo/rydewhite.png",
                            ),
                          ),
                        );
                      }
                    }),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),

            //name textfield
            RegistrationScreenTextField(
              controller: nameController,
              title: "Name",
              hint: "",
              readonly: false,
              keyBoardType: TextInputType.name,
            ),
            SizedBox(height: 2.h),

            //mobile number text feild
            RegistrationScreenTextField(
              controller: mobileController,
              title: "Mobile number",
              hint: "",
              readonly: true,
              keyBoardType: TextInputType.number,
            ),
            SizedBox(height: 2.h),

            //email text field
            RegistrationScreenTextField(
              controller: emailController,
              title: "Email",
              hint: "ryde@gmail.com",
              readonly: false,
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 4.h),

            //checklist  area
            selectUserType('Customer'),
            SizedBox(height: 2.h),
            selectUserType("Partner"),

            SizedBox(height: 4.h),
            //choose between being a customer or partner
            Builder(builder: ((context) {
              if (userType == "Partner") {
                return partner();
              } else {
                return customer();
              }
            })),
          ],
        ),

        //button
      ),
    );
  }

  selectUserType(String updateUserType) {
    return InkWell(
      onTap: () {
        if (registerButtonPressed == false) {
          setState(() {
            userType = updateUserType;
          });
        }
      },
      child: Row(
        children: [
          Container(
            height: 2.h,
            width: 2.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.sp),
              border: Border.all(
                color: userType == updateUserType ? black : grey,
              ),
            ),
            child: Icon(
              Icons.check,
              color: userType == updateUserType ? black : transparent,
              size: 2.h,
            ),
          ),
          SizedBox(width: 3.w),
          Text(
            'Continue as a $userType',
            style: AppTextStyles.small10.copyWith(
              color: userType == updateUserType ? black : grey,
            ),
          ),
        ],
      ),
    );
  }

  customer() {
    return Column(
      children: [
        SizedBox(height: 14.h),
        ElevatedButtonCommon(
          onPressed: () {},
          backgroundColor: black,
          height: 6.h,
          width: 94.w,
          child: registerButtonPressed == true
              ? CircularProgressIndicator(color: white)
              : Text(
                  "Continue",
                  style: AppTextStyles.body14.copyWith(color: white),
                ),
        ),
      ],
    );
  }

  partner() {
    return Column(
      children: [
        //vehicle brand field
        RegistrationScreenTextField(
          controller: vehicleBrandNameController,
          title: "Vehicle brand Name",
          hint: "",
          readonly: false,
          keyBoardType: TextInputType.name,
        ),
        SizedBox(height: 2.h),
        //vehicle model field
        RegistrationScreenTextField(
          controller: vehicleModelNameController,
          title: "Vehicle Model",
          hint: "",
          readonly: false,
          keyBoardType: TextInputType.name,
        ),
        SizedBox(height: 2.h),
        //vehicle type
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Vehicle Type", style: AppTextStyles.body14),
            SizedBox(height: 1.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                border: Border.all(color: grey),
              ),
              child: DropdownButton(
                  isExpanded: true,
                  value: selectedVehicleType,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  underline: const SizedBox(),
                  items: vehicleTypes
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: AppTextStyles.small12,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedVehicleType = value;
                    });
                  }),
            ),
          ],
        ),

        SizedBox(height: 2.h),

//vehicle registration field
        RegistrationScreenTextField(
          controller: vehicleRegistrationNumberController,
          title: "Vehicle Registration Number",
          hint: "",
          readonly: false,
          keyBoardType: TextInputType.number,
        ),
        SizedBox(height: 2.h),

        // vehicle locence number field
        RegistrationScreenTextField(
          controller: drivingLicenceNumberController,
          title: "Driver Licence number",
          hint: "",
          readonly: false,
          keyBoardType: TextInputType.number,
        ),
        SizedBox(height: 2.h),
        ElevatedButtonCommon(
          onPressed: () {},
          backgroundColor: black,
          height: 6.h,
          width: 94.w,
          child: registerButtonPressed == true
              ? CircularProgressIndicator(color: white)
              : Text(
                  "Continue",
                  style: AppTextStyles.body14.copyWith(color: white),
                ),
        ),
      ],
    );
  }
}

class RegistrationScreenTextField extends StatefulWidget {
  const RegistrationScreenTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    required this.readonly,
    required this.keyBoardType,
  });

  final TextEditingController controller;
  final String title;
  final String hint;
  final bool readonly;
  final TextInputType keyBoardType;

  @override
  State<RegistrationScreenTextField> createState() =>
      _RegistrationScreenTextFieldState();
}

class _RegistrationScreenTextFieldState
    extends State<RegistrationScreenTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.body14,
        ),
        SizedBox(height: 1.h),
        TextFormField(
          controller: widget.controller,
          cursorColor: black,
          style: AppTextStyles.textFieldHintTextStyle,
          keyboardType: widget.keyBoardType,
          readOnly: widget.readonly,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
            hintText: widget.hint,
            hintStyle: AppTextStyles.textFieldHintTextStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: black),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
            ),
          ),
        ),
      ],
    );
  }
}
