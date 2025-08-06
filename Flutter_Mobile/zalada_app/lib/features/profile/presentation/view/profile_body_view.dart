import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/router_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/features/profile/data/model/profile_setting_model.dart';
import 'package:zalada_app/features/profile/data/model/profile_settings_data_model.dart';

class ProfileBodyView extends StatelessWidget {
  const ProfileBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 300.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),

              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [ColorApp.blue60, ColorApp.light80],
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.r,
                  child: Image.asset("assets/png/img_2.png", fit: BoxFit.cover),
                ),
                SizedBox(height: 18.h),
                const Text("Bryan Adam", style: StylesTextApp.textStyle18),
                SizedBox(height: 4.h),
                Text(
                  "bryan.adam87@gmail.com",
                  style: StylesTextApp.textStyle14.copyWith(
                    color: ColorApp.dark25,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        SliverToBoxAdapter(
          child: Text(
            "Account Settings",
            style: StylesTextApp.textStyle18.copyWith(color: ColorApp.dark25),
          ),
        ),
        SliverList.builder(
          itemCount: ProfileSettingsDataModel.profileSettings.length,
          itemBuilder: (context, index) {
            return ProfileItem(
              profileAccountSettings:
                  ProfileSettingsDataModel.profileSettings[index],
            );
          },
        ),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        SliverToBoxAdapter(
          child: Text(
            "General",
            style: StylesTextApp.textStyle18.copyWith(color: ColorApp.dark25),
          ),
        ),
        SliverList.builder(
          itemCount: ProfileSettingsDataModel.profileSettings.length,
          itemBuilder: (context, index) {
            return ProfileItem(
              profileAccountSettings:
                  ProfileSettingsDataModel.profileSettings[index],
            );
          },
        ),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        SliverToBoxAdapter(
          child: ProfileItem(
            profileAccountSettings: ProfileSettingsModel(
              title: "logout",
              iconLeading: const Icon(Icons.logout, color: ColorApp.red100),
              iconTrailing: const Icon(
                Icons.arrow_forward,
                color: ColorApp.red100,
              ),
              onPressed: () {
                GoRouter.of(context).go(RouterApp.login);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({required this.profileAccountSettings, super.key});
  final ProfileSettingsModel profileAccountSettings;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: profileAccountSettings.iconLeading,
      title: Text(
        profileAccountSettings.title,
        style: StylesTextApp.textStyle16.copyWith(
          color: profileAccountSettings.color,
        ),
      ),
      trailing: IconButton(
        onPressed: profileAccountSettings.onPressed,

        icon: profileAccountSettings.iconTrailing,
      ),
    );
  }
}
