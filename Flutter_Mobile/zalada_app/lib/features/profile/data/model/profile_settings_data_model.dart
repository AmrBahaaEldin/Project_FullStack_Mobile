import 'package:flutter/material.dart';
import 'package:zalada_app/features/profile/data/model/profile_setting_model.dart';

class ProfileSettingsDataModel {
  ProfileSettingsDataModel._();
  static List<ProfileSettingsModel> profileSettings = [
    ProfileSettingsModel(
      title: "Address",
      iconLeading: const Icon(Icons.fmd_good),
      iconTrailing: const Icon(Icons.arrow_forward),

    ),
    ProfileSettingsModel(
      title: "Payment Method",
      iconLeading: const Icon(Icons.credit_card),
      iconTrailing: const Icon(Icons.arrow_forward),

    ),
    ProfileSettingsModel(
      title: "Account Security",
      iconLeading: const Icon(Icons.gpp_good),
      iconTrailing: const Icon(Icons.arrow_forward),

    ),
  ];
}
