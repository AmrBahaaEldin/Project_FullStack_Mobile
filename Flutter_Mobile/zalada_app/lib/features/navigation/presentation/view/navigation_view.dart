import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/features/home/hoem.dart';
import 'package:zalada_app/features/profile/presentation/view/profile_view.dart';

class NavigationMainView extends StatelessWidget {
  const NavigationMainView({super.key});
  // final PersistentTabController _controller=PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.light100,
      bottomNavigationBar: PersistentTabView(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
        handleAndroidBackButtonPress: true,

        navBarStyle: NavBarStyle.style16,
        bottomScreenMargin: 10,
        hideNavigationBarWhenKeyboardAppears: true,
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "Home",
            activeColorPrimary: ColorApp.blue100,
            inactiveColorPrimary: ColorApp.dark25,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.search),
            title: "Search",
            activeColorPrimary: ColorApp.green60,
            inactiveColorPrimary: ColorApp.dark25,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.favorite),
            title: "wishlist",
            activeColorPrimary: ColorApp.red100,
            activeColorSecondary: ColorApp.light100,
            inactiveColorPrimary: ColorApp.dark25,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.local_mall),
            title: "cart",
            activeColorPrimary: ColorApp.yellow100,
            inactiveColorPrimary: ColorApp.dark25,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.person),
            title: "profile",
            activeColorPrimary: ColorApp.violet100,
            inactiveColorPrimary: ColorApp.dark25,
          ),
        ],
        context,
        screens: [
          const HomeView(),
          const HomeView(),
          const HomeView(),
          const HomeView(),
          const ProfileView(),
        ],
      ),
    );
  }
}
