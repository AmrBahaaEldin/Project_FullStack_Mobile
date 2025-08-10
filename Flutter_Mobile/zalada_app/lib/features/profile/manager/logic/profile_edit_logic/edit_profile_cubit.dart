import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zalada_app/features/profile/data/model/edit_profile_model/edit_profile_model_input.dart';
import 'package:zalada_app/features/profile/data/repo/repo_edit_profile/repo_edit_profile_impl.dart';
import 'package:zalada_app/features/profile/manager/logic/profile_edit_logic/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.repoEditProfileImpl) : super(EditProfileInitial());
  RepoEditProfileImpl repoEditProfileImpl;
  final TextEditingController genderController = TextEditingController();

  final TextEditingController birthdayCountryController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeCountryController = TextEditingController();
   String? textFirstNameHint;
   String? textEmailHint;
   String? numberPhoneHint;
   String? codeCountryHint;
   String? genderHint;
   String? birthdayHint;

  String get fullPhone => codeCountryController.text + phoneController.text;

  void updataProfile({
    required int userId,
    EditProfileInputModel? editProfileInput,
  }) async {
    emit(EditProfileLoading());
    final data = await repoEditProfileImpl.updataProfile(
      userId: userId,
      editProfileInputModel: editProfileInput,
    );
    data.fold(
      (failure) {
        emit(EditProfileFailure(failure: failure));
      },
      (data) {
        emit(EditPRofileSucess(editProfileModel: data));
      },
    );
  }
}
