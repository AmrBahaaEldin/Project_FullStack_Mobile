import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProfileModel {
  final String title;
  final Icon iconLeading;
  final Icon ?iconTrailing;

  ProfileModel({required this.title, required this.iconLeading, this.iconTrailing});
}
class AccountSettingsModel extends ProfileModel {


  AccountSettingsModel({required super.title, required super.iconLeading,required super.iconTrailing,});
}
class GeneralModel extends ProfileModel {

  GeneralModel({required super.title, required super.iconLeading,required super.iconTrailing,});
}
class LeaveModel extends ProfileModel {

  LeaveModel({required super.title, required super.iconLeading, super.iconTrailing,});
}


List<ProfileModel> accountSettings = [
  AccountSettingsModel(
    title: "Address",
    iconLeading: const Icon(
      Icons.location_on,
      color:AppColor.iconColor,
    ),
    iconTrailing : Icon(

      Icons.arrow_forward_ios_outlined,
      color:AppColor.iconColor,
    ),

  ),
  AccountSettingsModel(
    title: "Payment Method",
    iconLeading: const Icon(
      Icons.payment,
      color:AppColor.iconColor,
    ),
    iconTrailing: const Icon(
      Icons.arrow_forward_ios_outlined,
      color:AppColor.iconColor,
    ),

  ),
  AccountSettingsModel(
    iconTrailing: const Icon(
      Icons.toggle_on_rounded,
      color:Colors.green,
      size: 60,
    ),
  title: "Notification",
    iconLeading: Icon(
      Icons.notifications_sharp,
      color:AppColor.iconColor,
    )
  ),
  AccountSettingsModel(
    iconTrailing: const Icon(
      Icons.arrow_forward_ios_outlined,
      color:AppColor.iconColor,
    ),
  title: "Account Security",
    iconLeading: Icon(
      Icons.security_rounded,
      color:AppColor.iconColor,
    )
  ),
];
List<ProfileModel> generalModel = [
  AccountSettingsModel(
    title: "Invite Friends",
    iconLeading: const Icon(
      Icons.group_add_outlined,
      color:AppColor.iconColor,
    ),
    iconTrailing: const Icon(
      Icons.arrow_forward_ios_outlined,
      color:AppColor.iconColor,
    ),

  ),
  AccountSettingsModel(
    title: "Privacy Policy",
    iconLeading: const Icon(
      Icons.lock_outline_rounded,
      color:AppColor.iconColor,
    ),
    iconTrailing: const Icon(
      Icons.arrow_forward_ios_outlined,
      color:AppColor.iconColor,
    ),

  ),
  AccountSettingsModel(
    iconTrailing: const Icon(
      Icons.arrow_forward_ios_outlined,
      color:AppColor.iconColor,
    ),
  title: "Help Center",
    iconLeading: Icon(
      Icons.help_outline_rounded,
      color:AppColor.iconColor,
    )
  ),

];
List<ProfileModel> leaveModel = [
  LeaveModel(
    title: "Logout",
    iconLeading: const Icon(
      CupertinoIcons.arrow_right_square,
      color:AppColor.fontSelectColor,
    ),
    iconTrailing:null,

  ),


];
