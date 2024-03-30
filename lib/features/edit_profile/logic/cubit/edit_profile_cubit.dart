import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/core/helpers/permissions.dart';
import 'package:salla_app/features/edit_profile/data/models/edit_profile_request_body.dart';
import 'package:salla_app/features/edit_profile/data/repos/edit_profile_repo.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_state.dart';

class EditProfileCubit extends BaseSafeCubit<EditProfileState> {
  final EditProfileRepo _editProfileRepo;
  EditProfileCubit(this._editProfileRepo)
      : super(const EditProfileState.initial());

  final TextEditingController nameController =
      TextEditingController(text: AppData.userModel.name);

  final TextEditingController emailController =
      TextEditingController(text: AppData.userModel.email);

  final TextEditingController phoneController =
      TextEditingController(text: AppData.userModel.phone);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? imageFile;
  void emitPickImageState() async {
    safeEmit(const EditProfileState.initial());
    if (await requestStoragePermission()) {
      ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageFile = File(image.path);
      }
    }
    safeEmit(const EditProfileState.pickImageState());
  }

  void emitEditProfileState() async {
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      safeEmit(const EditProfileState.loading());
      final response = await _editProfileRepo.editProfile(
        EditProfileRequestBody(
          nameController.text,
          emailController.text,
          phoneController.text,
        ),
      );
      response.when(
        success: (data) async {
          String avatar = AppData.userModel.avatar ?? '';
          AppData.userModel = data.data!;
          AppData.userModel.avatar = avatar;
          if (imageFile != null) {
            uploadAvatar(data.message);
          } else {
            safeEmit(EditProfileState.success(message: data.message));
          }
        },
        failure: (error) {
          safeEmit(EditProfileState.error(message: error));
        },
      );
    }
  }

  void uploadAvatar(String message) async {
    final uploadAvatarRes = await _editProfileRepo.uploadAvatar(imageFile!);
    uploadAvatarRes.when(
      success: (url) async {
        AppData.userModel.avatar = url;
        safeEmit(EditProfileState.success(message: message));
      },
      failure: (error) {
        safeEmit(EditProfileState.error(message: error));
      },
    );
  }
}
