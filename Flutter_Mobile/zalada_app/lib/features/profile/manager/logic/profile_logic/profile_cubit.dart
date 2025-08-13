import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:zalada_app/core/utils/cache_db_app.dart';
import 'package:zalada_app/features/profile/data/repo/repo_profile/repo_profile_impl.dart';
import 'package:zalada_app/features/profile/manager/logic/profile_logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repo) : super(ProfileLoading());
  RepoProfileImpl repo;
  void fecthDataProfile({required String author}) async {
    final data = await repo.getProfile(author);
    data.fold((failure) => emit(ProfileFailure(failure: failure)), (data) {
      
      emit(ProfileLoaded(profileShow: data));

      debugPrint(
        "_______________${CacheApp.getData(key: "UserId")}___________________",
      );
    });
  }
}
