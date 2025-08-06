import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zalada_app/features/navigation/manager/navigation_logic/main_navigation_state.dart';

class MainNavigationCubit extends Cubit<MainNavigationState> {
  MainNavigationCubit() : super(MainNavigationInitial());

  void changeIndex(int index) {
    emit(MainNavigationChanged(index));
  }

  int get currentIndex {
    if (state is MainNavigationInitial) {
      return (state as MainNavigationInitial).index;
    } else if (state is MainNavigationChanged) {
      return (state as MainNavigationChanged).index;
    }
    return 0;
  }
}
