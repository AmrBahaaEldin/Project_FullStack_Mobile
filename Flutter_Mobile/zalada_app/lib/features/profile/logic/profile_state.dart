


import 'package:e_commerce_app/features/login/data/login_model.dart';
import 'package:e_commerce_app/features/profile/data/profile_model.dart';

abstract class ProfileState {}

class InitialProfileState extends ProfileState {}
class LoadingProfileState extends ProfileState {}
class SuccessProfileState extends ProfileState {
   ProfileMeModel ?userModel;
  SuccessProfileState({this.userModel});
}
class ErrorProfileState extends ProfileState {
  final String message;
  ErrorProfileState({required this.message});
}
