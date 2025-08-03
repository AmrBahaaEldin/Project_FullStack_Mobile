
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/endpoints.dart';
import 'package:e_commerce_app/core/network/new_api.dart';
import 'package:e_commerce_app/core/network/new_end_points.dart';
import 'package:e_commerce_app/features/register/data/register_model.dart';
import 'package:e_commerce_app/features/register/logic/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isShowPassword = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  IconData icon = Icons.visibility_outlined;
  late RegisterModel registerModel;

  void setHide() {
    isShowPassword = !isShowPassword;
    icon =
    isShowPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterHide());
  }

  void userRegister(String email, String userName, String password, String phone) async {
    emit(RegisterLoading());
    try{
      Response response= await NewApi.postData(url: NewEndPoints.registerEndPoint_v2, data:{
        'email': email,
        'name': userName,
        'password': password,
        "image":"",
        "phone":phone,
      } );
      if (response.statusCode==200) {
        registerModel= RegisterModel.fromJson(response.data);
        emit(RegisterSuccess(registerModel: registerModel));
      }
      
    }
    catch(e){
      emit(RegisterError(error: e.toString()));
    }


  }
}
