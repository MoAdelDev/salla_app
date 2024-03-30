import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/core/helpers/permissions.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_state.dart';

class EditProfileCubit extends BaseSafeCubit<EditProfileState> {
  EditProfileCubit() : super(const EditProfileState.initial());

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

  void emitEditProfileState() {
    safeEmit(const EditProfileState.loading());
  }
}
