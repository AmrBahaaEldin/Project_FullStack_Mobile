import 'package:bloc/bloc.dart';

import 'package:zalada_app/features/auth/data/repo/repo_register_impl.dart';
import 'package:zalada_app/features/auth/manager/register_logic/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.repoRegisterImpl) : super(RegisterInitial());

  final RepoRegisterImpl repoRegisterImpl;
  Future<void> fetchRegister({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    final result = await repoRegisterImpl.registerPost(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(RegisterError(failure));
      },
      (value) {
        
        emit(RegisterSuccess(value));
      },
    );
  }
}
