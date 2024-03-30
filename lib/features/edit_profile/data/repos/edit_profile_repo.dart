import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/edit_profile/data/models/edit_profile_request_body.dart';
import 'package:salla_app/features/edit_profile/data/models/edit_profile_response_body.dart';

class EditProfileRepo {
  final ApiService _apiService;

  EditProfileRepo(this._apiService);

  Future<ApiResult<EditProfileResponseBody>> editProfile(
      EditProfileRequestBody editProfileRequestBody) async {
    final String token = await CacheHelper.token;
    try {
      final response =
          await _apiService.editProfile(token, editProfileRequestBody);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message);
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }

  Future<ApiResult<String>> uploadAvatar(File image) async {
    try {
      final response = await FirebaseStorage.instance
          .ref()
          .child('users/${AppData.userModel.id}')
          .putFile(image);
      if (response.state == TaskState.success) {
        final String downloadUrl = await response.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('images')
            .doc(AppData.userModel.id.toString())
            .update({
          'image': downloadUrl,
        });

        return ApiResult.success(await response.ref.getDownloadURL());
      }
      return const ApiResult.failure('Failed to upload image');
    } on FirebaseException catch (e) {
      print(e.message);
      return ApiResult.failure(e.message ?? '');
    }
  }
}
