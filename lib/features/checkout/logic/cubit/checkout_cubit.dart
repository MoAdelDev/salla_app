import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response.dart';
import 'package:salla_app/features/checkout/data/models/promo_code_request.dart';
import 'package:salla_app/features/checkout/data/repos/addresses_repo.dart';
import 'package:salla_app/features/checkout/data/repos/promo_code_repo.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final PromoCodeRepo _promoCodeRepo;
  final AddressesRepo _addressesRepo;
  CheckoutCubit(
    this._promoCodeRepo,
    this._addressesRepo,
  ) : super(const CheckoutState.initial());

  final TextEditingController promoCodeController = TextEditingController();
  bool isPromoCodeApplyLoading = false;

  void emitPromoCodeState() async {
    isPromoCodeApplyLoading = true;
    emit(const CheckoutState.applyPromoCodeLoading());
    if (promoCodeController.text.isNumber()) {
      final result = await _promoCodeRepo.applyPromoCode(
        PromoCodeRequest(code: int.parse(promoCodeController.text)),
      );
      result.when(
        success: (response) {
          emit(CheckoutState.applyPromoCodeSuccess(response.message));
        },
        failure: (message) {
          emit(CheckoutState.applyPromoCodeFailure(message));
        },
      );
      isPromoCodeApplyLoading = false;
    } else {
      isPromoCodeApplyLoading = false;
      emit(const CheckoutState.applyPromoCodeFailure('Please enter number'));
    }
  }

  int addressSelectedId = 0;
  List<AddressModel>? addresses;
  void emitAddressesState() async {
    emit(const CheckoutState.loading());
    final result = await _addressesRepo.getAddresses();
    result.when(
      success: (response) {
        addresses = response.data?.addresses;
        addressSelectedId = response.data?.addresses.first.id ?? 0;
        emit(CheckoutState.success(response.data?.addresses ?? []));
      },
      failure: (message) {
        emit(CheckoutState.failure(message));
      },
    );
  }

  void emitSelectAddressState(int addressId) {
    emit(const CheckoutState.initial());
    addressSelectedId = addressId;
    emit(const CheckoutState.selectItem());
  }

  int paymentMethodSelected = 1;
  void emitSelectPaymentState(int paymentSelected) {
    emit(const CheckoutState.initial());
    paymentMethodSelected = paymentSelected;
    emit(const CheckoutState.selectItem());
  }
}
