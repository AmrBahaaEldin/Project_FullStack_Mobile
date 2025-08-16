import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zalada_app/core/constant/color_app.dart';

import 'package:zalada_app/features/navigation/data/model/app_bar_view_model.dart';
import 'package:zalada_app/features/navigation/data/model/body_view_model.dart';
import 'package:zalada_app/features/navigation/manager/navigation_logic/main_navigation_cubit.dart';
import 'package:zalada_app/features/navigation/manager/navigation_logic/main_navigation_state.dart';

class NavigationMainView extends StatelessWidget {
  const NavigationMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainNavigationCubit(),
      child: BlocBuilder<MainNavigationCubit, MainNavigationState>(
        builder: (context, state) {
          return Scaffold(
            appBar:
                AppBarViewModel.appBarWidget[context
                    .watch<MainNavigationCubit>()
                    .currentIndex],
            body: BodyViewModel
                .boyWidgets[context.watch<MainNavigationCubit>().currentIndex],
            bottomNavigationBar: GNav(
              gap: 2,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              activeColor: ColorApp.light100,
              iconSize: 20,
              tabMargin: const EdgeInsets.symmetric(vertical: 10),
              curve: Curves.easeInOut, // أفضل من Easing.standard للحركة
              style: GnavStyle.google,

              duration: const Duration(milliseconds: 300),
              tabBackgroundColor: ColorApp.blue100,
              color: ColorApp.dark50,
              selectedIndex: context.watch<MainNavigationCubit>().currentIndex,
              onTabChange: (index) {
                context.read<MainNavigationCubit>().changeIndex(index);
              },

              mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع متساوي
              tabs: [
                const GButton(icon: Icons.home, text: 'Home'),
                const GButton(icon: Icons.search, text: 'Browse'),
                const GButton(icon: Icons.local_mall, text: 'Cart'),
                const GButton(icon: Icons.person, text: 'Profile'),
              ],
            ),
          );
        },
      ),
    );
  }
}
