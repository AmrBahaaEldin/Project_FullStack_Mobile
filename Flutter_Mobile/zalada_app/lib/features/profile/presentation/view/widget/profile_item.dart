import 'package:flutter/material.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/features/profile/data/model/profile_setting_model.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({required this.profileAccountSettings, super.key, this.trailing});
  final ProfileSettingsModel profileAccountSettings;
  final Widget? trailing;

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
      trailing:trailing??profileAccountSettings.iconTrailing,
      // trailing: Icon(
    );
  }
}
