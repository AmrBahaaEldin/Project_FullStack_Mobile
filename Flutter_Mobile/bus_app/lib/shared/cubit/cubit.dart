


import 'package:bus_app/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';









import '../../Views/Map/UserMap/user_map.dart';
import '../../Views/Setting/setting_screen.dart';



import '../../Views/TourStation/tour_station_view.dart';
import '../../screen/Search/Search_Screen.dart';
import '../network/local/cache_helper.dart';





class AppCubit extends Cubit<AppStates>
{

  AppCubit():super(AppInitialState ());


  //Make Object your Class Cubit
  static AppCubit get(context)=>BlocProvider.of(context);
  /*//LoginScreen
  void  userLoginApp   ({

    required String email,
    required String password,
  })
  {
    //loading when   give Data
    emit(AppLoginLoadingState());*/



  IconData suffixIconPassword =Icons.visibility_outlined;
  bool isPassword =true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffixIconPassword= isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(AppLoginChangePasswordState());



  }
  ///////


  //////toggle between page Home_Screen_body/////

  List<Widget>homeScreen=[
    const UserMap(),
     SearchScreen(),
    const TourStationScreen(),
    const SettingScreen(),
  ];
  int currentHomeIndex=1;
  void toggleHomePage(index){
    currentHomeIndex=index;


    // emit(AppNavButtomState()); /// test wait edit
    //only test not Ture

    if(currentHomeIndex==0){

      emit(AppMapState());
    }
    else if(currentHomeIndex==1){
      emit(AppSearchState());
    }
    else if(currentHomeIndex==2){
      emit(AppGuidanceState());

    }
    else{
      emit(AppSettingState());
    }
  }

 /* //////toggle between page Driver_Screen/////
  List<Widget>driverScreen=[
       const MapScreen(),
       const ScanScreen(),
    //  const AccountScreen(),
  ];
  ///////////////////////////////
  int currentDriverIndex=2;
  void toggleDriverPage(index){
    currentDriverIndex=index;
    // emit(AppNavButtomState()); /// test wait edit
    //only test not Ture

     if(currentDriverIndex==0){

       emit(AppMapState());
     }
    else if(currentDriverIndex==1){
      emit(AppScanState());
    }
   else{
      emit(AppAccountState());
    }
  }*/

  ///////////////////////////////////////////////////////////Theme//////////////////////////////////
  bool isDark = true;
  void changeTheme({ bool? statePage }) {
    if (statePage != null) {
      isDark = statePage;
    }
    else {
      isDark = !isDark;
      CacheData.setData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeTheme());
      });
    }
  }
  ///////////////////////////////////////////////////////language//////////////////////////////////
  List<String>language=[
    'ar',
    'en',
  ];
  int selectedLanguage=1;
  void changeLanguage({String? stateLanguage}){
    if ( stateLanguage != null){
      language[selectedLanguage]=stateLanguage;

    }
    else{

      CacheData.setData(key: "stateLanguage",
      value: language[selectedLanguage]).then((value) {
        emit(AppChangeLanguage());
      } );


      }



    }
  }
