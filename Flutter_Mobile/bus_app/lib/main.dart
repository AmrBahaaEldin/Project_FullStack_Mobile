
// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:bus_app/screen/loading/loading_Screen.dart';
import 'package:bus_app/shared/cubit/cubit.dart';
import 'package:bus_app/shared/network/local/cache_helper.dart';
import 'package:bus_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Views/Login_Screen/login_screen.dart';
import 'Views/Map/UserMap/user_map.dart';
import 'Views/detector/intro_work_detector_view.dart';
import 'Views/driver/driver_view.dart';
import 'generated/l10n.dart';
import 'shared/BlockobServer.dart';
import 'shared/cubit/state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//app not work before execute methods above runApp
 await CacheData.cacheInitialization();
bool ?isDark = CacheData.getData(key: 'isDark');
String ? selectedLanguage=CacheData.getData(key: 'selectedLanguage');
  Bloc.observer = MyBlocObserver();
  runApp( MyApp(isDark,selectedLanguage));
}
class MyApp extends StatelessWidget {
 final  isDark;
 final selectedLanguage;



    const MyApp(this.isDark,
       this.selectedLanguage,
       {super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // وجهة معينة
     return    MultiBlocProvider(
         providers:[
       BlocProvider(create: (context) => AppCubit()
         ..changeTheme(
         statePage:isDark,)

         ..changeLanguage(
         stateLanguage: selectedLanguage,
       ),
       ),

     ],
         child: BlocConsumer<AppCubit,AppStates>(
           listener: (context, state) {

           },
           builder: (context, state) {
           AppCubit cubit= AppCubit.get(context);
        return   MaterialApp(



          locale:  const Locale('ar'),
          ////////////language////////////////////
          localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,

          ////////////////////////////////////////////////////////////////////////
          debugShowCheckedModeBanner: false,
          theme: lightTheme,

          darkTheme: darkTheme,

          themeMode:cubit.isDark ? ThemeMode.dark:ThemeMode.light,


          home:  const LoadingScreen(),
        );
           },
             ),
     );

  }
}



