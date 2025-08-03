import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/network/new_api.dart';
import 'package:e_commerce_app/core/network/new_end_points.dart';
import 'package:e_commerce_app/features/login/data/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


import '../../../core/network/dio_helper.dart';
import '../../../core/network/endpoints.dart';
import '../../home/presentation/home_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
 late LoginModel loginModel;
 bool isHide=false;
  void setHide(){
   isHide=!isHide;
   emit(LoginHidePassword());
 }
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
   TextEditingController controllerEmail = TextEditingController();
   TextEditingController controllerPassword = TextEditingController();

  Future <void> userLogin(String email, String password)async{
   emit(LoginLoading());
    try{

    Response response= await NewApi.postData(url:NewEndPoints.loginEndPoint_v2 , data:
     {'email': email, 'password': password},
    );
    if (response.statusCode==200) {
    loginModel= LoginModel.fromJson(response.data);
      emit(LoginSuccess(loginModel: loginModel));
    }
    }
    catch(e){

   emit(LoginError(error: e.toString()));
    }

  }
}
