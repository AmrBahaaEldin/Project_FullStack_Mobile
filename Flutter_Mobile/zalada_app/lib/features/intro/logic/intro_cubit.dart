


import 'package:e_commerce_app/features/intro/presentation/widget/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login/presentation/widget/login_screen.dart';
import 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());
  int index=0;
  void changePage(context) {
    if (index==2) {
      checkCache(context);
    }
    else{
      index++;
    }

    emit(ChangePageState());
  }
   double changeValuePage(){
    if (index == 0) {
      return .5;
    }
    else if (index == 1)
    {
      return .75;
    }
    else
    {
      return 1;
    }

  }
}
