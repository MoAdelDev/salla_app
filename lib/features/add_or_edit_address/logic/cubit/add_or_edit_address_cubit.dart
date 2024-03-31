import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/add_or_edit_address/data/models/add_or_edit_address_request_body.dart';
import 'package:salla_app/features/add_or_edit_address/data/repos/add_address_repo.dart';
import 'package:salla_app/features/add_or_edit_address/data/repos/edit_address_repo.dart';
import 'package:salla_app/features/add_or_edit_address/logic/cubit/add_or_edit_address_state.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

class AddOrEditAddressCubit extends BaseSafeCubit<AddOrEditAddressState> {
  final AddAddressRepo _addAddressRepo;
  final EditAddressRepo _editAddressRepo;
  AddOrEditAddressCubit(this._addAddressRepo, this._editAddressRepo)
      : super(const AddOrEditAddressState.initial());

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void emitControllers(AddressModel? address) {
    fullNameController.text = address?.name ?? '';
    addressController.text = address?.details ?? '';
    noteController.text = address?.notes ?? '';
    cityController.text = address?.city ?? '';
    regionController.text = address?.region ?? '';
  }

  void emitAddAddressState() async {
    if (formKey.currentState!.validate()) {
      safeEmit(const AddOrEditAddressState.loading());
      final result = await _addAddressRepo.addAddress(
        AddOrEditAddressRequestBody(
          fullNameController.text,
          addressController.text,
          noteController.text,
          cityController.text,
          regionController.text,
          0.0,
          0.0,
        ),
      );
      result.when(
        success: (data) {
          safeEmit(AddOrEditAddressState.success(data.message));
        },
        failure: (error) {
          safeEmit(AddOrEditAddressState.error(error));
        },
      );
    }
  }

  void emitEditAddressState(int addressId) async {
    if (formKey.currentState!.validate()) {
      safeEmit(const AddOrEditAddressState.loading());
      final result = await _editAddressRepo.updateAddress(
        addressId,
        AddOrEditAddressRequestBody(
          fullNameController.text,
          addressController.text,
          noteController.text,
          cityController.text,
          regionController.text,
          0.0,
          0.0,
        ),
      );
      result.when(
        success: (data) {
          safeEmit(AddOrEditAddressState.success(data.message));
        },
        failure: (error) {
          safeEmit(AddOrEditAddressState.error(error));
        },
      );
    }
  }
}
