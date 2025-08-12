import 'package:bloc/bloc.dart';
import 'package:zalada_app/features/home/data/repo/repo_home_impl.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repoHomeIm) : super(HomeInitial());
  final RepoHomeIm repoHomeIm;
  void fetchProduceCategory(String categoryProduce) async {
    emit(HomeLoading());
    final response = await repoHomeIm.fetchProduces(
      categoryProduce: categoryProduce,
    );
    response.fold(
      (failure) {
        emit(HomeFailure(failure));
      },
      (data) {
        emit(HomeLoaded(data));
      },
    );
  }
}
