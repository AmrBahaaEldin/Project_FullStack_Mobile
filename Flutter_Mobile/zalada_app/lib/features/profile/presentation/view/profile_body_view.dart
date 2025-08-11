import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/router_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/cache_db_app.dart';
import 'package:zalada_app/features/profile/data/model/profile_setting_model.dart';
import 'package:zalada_app/features/profile/data/model/profile_settings_data_model.dart';
import 'package:zalada_app/features/profile/data/repo/repo_profile/repo_profile_impl.dart';
import 'package:zalada_app/features/profile/manager/logic/profile_logic/profile_cubit.dart';
import 'package:zalada_app/features/profile/manager/logic/profile_logic/profile_state.dart';
import 'package:zalada_app/features/profile/presentation/view/widget/profile_item.dart';

class ProfileBodyView extends StatelessWidget {
  const ProfileBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final String auth = CacheApp.getData(key: "accessToken");
        debugPrint(
          "________________________________________ProfileView_______________",
        );

        return ProfileCubit(RepoProfileImpl(ApiService(Dio())))
          ..fecthDataProfile(author: auth);
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
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
                        //change Dynamic image Profile Please Fast Change
                        CircleAvatar(
                          radius: 50.r,
                          child: Image.network(
                            state.profileShow.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 60.h),
                        Text(
                          state.profileShow.firstName!,
                          style: StylesTextApp.textStyle18,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          state.profileShow.email!,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Account Settings",
                      style: StylesTextApp.textStyle18.copyWith(
                        color: ColorApp.dark25,
                      ),
                    ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "General",
                      style: StylesTextApp.textStyle18.copyWith(
                        color: ColorApp.dark25,
                      ),
                    ),
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
                      iconLeading: const Icon(
                        Icons.logout,
                        color: ColorApp.red100,
                      ),
                      iconTrailing: const Icon(
                        Icons.arrow_forward,
                        color: ColorApp.red100,
                      ),
                      onPressed: () {
                        checkRemove(context);
                      },
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ProfileFailure) {
            return Center(child: Text(state.failure.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Future<void> checkRemove(BuildContext context) async {
  await CacheApp.removeData(key: "accessToken");
  if (!context.mounted) {
    return;
  }
  GoRouter.of(context).go(RouterApp.login);
}
