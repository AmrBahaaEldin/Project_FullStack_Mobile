import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBannerCubit extends Cubit<int> {
  SliderBannerCubit() : super(0);
  void changePage(int index) => emit(index);
}
