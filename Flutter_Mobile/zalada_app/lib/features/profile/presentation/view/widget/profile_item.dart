import 'package:flutter/material.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/features/profile/data/model/profile_setting_model.dart';

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
