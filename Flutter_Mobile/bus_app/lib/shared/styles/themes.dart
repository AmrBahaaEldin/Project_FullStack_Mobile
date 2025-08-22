import 'package:flutter/material.dart';

import 'colors.dart';

////////////////////////////
ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: scafBackDrak,

    textTheme: const TextTheme(bodyLarge: TextStyle(fontSize: 20,color: Color(0xffF9F9F9) )),
    appBarTheme:  const AppBarTheme(

      elevation: 0.0,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),




      titleTextStyle: TextStyle(color: Colors.white),
    ),


);


ThemeData lightTheme=ThemeData(


  //in put write user

    scaffoldBackgroundColor: scafBackLight,
    appBarTheme: AppBarTheme(


      backgroundColor: backGroundLight,
      iconTheme: IconThemeData(color: iconLight),

      titleTextStyle:TextStyle(color: titleLight),
    ),
  buttonTheme: ButtonThemeData(
    buttonColor: buttomIconLight

  ),

  

);