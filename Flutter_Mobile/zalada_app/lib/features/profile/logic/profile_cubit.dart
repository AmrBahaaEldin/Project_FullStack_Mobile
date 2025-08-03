import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/db/cache/cache.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/new_api.dart';
import 'package:e_commerce_app/core/network/new_end_points.dart';
import 'package:e_commerce_app/features/profile/data/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfileState());

  ProfileMeModel? userModel;
  static ProfileCubit get(context) => BlocProvider.of(context);
  final String? token = CacheHelper.getData(key: 'token');

  Future<void> getProfileData() async {
    if (token == null) {
      emit(ErrorProfileState(message: "Token is missing"));
      return;
    }

    emit(LoadingProfileState());

    try {
      Response response =await NewApi.getData(url: NewEndPoints.profileEndPoint_v2, token: token);


      if (response.statusCode == 200) {
        userModel = ProfileMeModel.fromJson(response.data);
        emit(SuccessProfileState(userModel: userModel));
      } else {
        emit(ErrorProfileState(message: "Failed to load profile data"));
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      emit(ErrorProfileState(message: e.toString()));
    }
  }
}