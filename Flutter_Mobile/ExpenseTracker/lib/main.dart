import 'package:bloc/bloc.dart';
import 'package:expensetracker/features/home/presentation/view/home_view.dart';
import 'package:expensetracker/features/main_navigation/presentation/view/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      designSize: const Size(375, 812),
      builder: (context, child) =>const MaterialApp(
        home:  HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
