import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:ride/constant/utils/colors.dart';
import 'package:ride/rider/controller/RiderBottomnavbarProvider/rider_bottomnavbar_provider.dart';
import 'package:ride/rider/view/ServiceRide/service_ride.dart';
import 'package:ride/rider/view/account/acount_screen_rider.dart';
import 'package:ride/rider/view/activity/activity.dart';
import 'package:ride/rider/view/homeScreen/ride_homescreen.dart';
import 'package:sizer/sizer.dart';

class RiderBottomNavBar extends StatefulWidget {
  const RiderBottomNavBar({super.key});

  @override
  State<RiderBottomNavBar> createState() => _RiderBottomNavBarState();
}

class _RiderBottomNavBarState extends State<RiderBottomNavBar> {
  List<Widget> screens = [
    const RiderHomeScreen(),
    const ServiceRideScreen(),
    const ActivityScreen(),
    const RiderAccountScreen(),
  ];
  List<PersistentBottomNavBarItem> navBarItem(int currentTab) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          currentTab == 0
              ? CupertinoIcons.house_alt_fill
              : CupertinoIcons.house,
        ),
        title: 'Home',
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          currentTab == 0
              ? CupertinoIcons.circle_grid_3x3_fill
              : CupertinoIcons.circle_grid_3x3,
        ),
        title: 'Services',
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          currentTab == 0
              ? CupertinoIcons.square_list_fill
              : CupertinoIcons.square_list,
        ),
        title: 'Activity',
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          currentTab == 0 ? CupertinoIcons.person_fill : CupertinoIcons.person,
        ),
        title: 'Account',
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
    ];
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return Consumer<RiderBottoNavBarProvider>(
        builder: (contex, tabProvider, child) {
      return PersistentTabView(
        context,
        controller: controller,
        screens: screens,
        items: navBarItem(tabProvider.currentTab),
        confineInSafeArea: true,
        onItemSelected: (value) {},
        backgroundColor: white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          colorBehindNavBar: white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
      );
    });
  }
}
