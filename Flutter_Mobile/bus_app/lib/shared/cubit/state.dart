abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppChangeButtonNavBarState extends AppStates{}
////////////DataBase///////////////////////////////////////
class AppCreateDatabaseState extends AppStates{}
class AppInsertDatabaseState extends AppStates{}
class AppGetDatabaseState extends AppStates{}
class AppUpDataDatabaseState extends AppStates{}
class AppDeleteDatabaseState extends AppStates{}
class AppGetDatabaseLoadingState extends AppStates{}
/////////////////////////////////////////////////////////////////
class AppChangeButtonSheetState extends AppStates{}
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////use loginScreen/////////////////

class AppLoginSuccessState extends AppStates{
  final  AppStates loginModel;

  AppLoginSuccessState(this.loginModel);
}
class AppLoginErrorState extends AppStates{
  final String error;

  AppLoginErrorState(this.error);

}
class AppLoginChangePasswordState extends AppStates{}
///////////////////////////////////////////////////////////////////////////
///toggle between pages Home


class AppScanState extends AppStates{}

///toggle between pages Home
class AppMapState extends AppStates{}
class AppSearchState extends AppStates{}
class AppGuidanceState extends AppStates{}
class AppSettingState extends AppStates{}

////////////////////////////////////////////////////////////////////////
///GuideSearch
class AppLoadingSearchState extends AppStates{}
///////////////////////////////////////////////////////////////////////////
class AppNavButtomState extends AppStates{}
////////////////////////////////////////////////////////////////////////
///Theme page
class AppChangeTheme extends AppStates{}
/////////////////////////////////////////////////////////////////////////
///language page
class AppChangeLanguage extends AppStates{}
