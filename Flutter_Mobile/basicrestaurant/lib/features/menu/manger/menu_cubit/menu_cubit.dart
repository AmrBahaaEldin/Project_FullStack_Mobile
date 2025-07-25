

import 'package:bloc/bloc.dart';

import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());
}
