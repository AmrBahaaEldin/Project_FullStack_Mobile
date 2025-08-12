import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zalada_app/features/search/data/repo/search_repo_impl.dart';
import 'package:zalada_app/features/search/manager/logic/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImpl) : super(SearchInitial());
  SearchRepoImpl searchRepoImpl;
  void search(String value) async {
    emit(SearchLoaing());
    final data = await searchRepoImpl.searchProdct(value);
    data.fold(
      (failure) {
        emit(SearchFailure(failure: failure));
      },
      (data) {
        emit(SearchSuccess(data: data));
      },
    );
  }
}
