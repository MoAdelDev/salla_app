import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/stripe/payment_intent_request_body.dart';
import 'package:salla_app/features/checkout/data/models/add_order_request_body.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';
import 'package:salla_app/features/checkout/data/models/promo_code_request_body.dart';
import 'package:salla_app/features/checkout/data/repos/add_order_repo.dart';
import 'package:salla_app/features/checkout/data/repos/addresses_repo.dart';
import 'package:salla_app/features/checkout/data/repos/payment_repo.dart';
import 'package:salla_app/features/checkout/data/repos/promo_code_repo.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final PromoCodeRepo _promoCodeRepo;
  final AddressesRepo _addressesRepo;
  final AddOrderRepo _addOrderRepo;
  final PaymentRepo _paymentRepo;
  CheckoutCubit(
    this._promoCodeRepo,
    this._addressesRepo,
    this._addOrderRepo,
    this._paymentRepo,
  ) : super(const CheckoutState.initial());

  final TextEditingController promoCodeController = TextEditingController();
  bool isPromoCodeApplyLoading = false;

  void emitPromoCodeState() async {
    isPromoCodeApplyLoading = true;
    emit(const CheckoutState.applyPromoCodeLoading());
    if (promoCodeController.text.isNumber()) {
      final result = await _promoCodeRepo.applyPromoCode(
        PromoCodeRequestBody(code: int.parse(promoCodeController.text)),
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
        if (addresses != null && addresses!.isNotEmpty) {
          addressSelectedId = addresses!.first.id;
        }
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

  void emitAddOrderState() async {
    if (addressSelectedId == 0) {
      showToast('Please select or add new address');
      return;
    }
    emit(const CheckoutState.addOrderLoading());
    final result = await _addOrderRepo.addOrder(
      AddOrderRequestBody(
        addressId: addressSelectedId,
        paymentMethod: paymentMethodSelected,
        usePoints: false,
      ),
    );
    result.when(success: (response) {
      emit(CheckoutState.addOrderSuccess(response.message));
    }, failure: (message) {
      emit(CheckoutState.addOrderFailure(message));
    });
  }

  void emitPaymentState(double totalPrice) async {
    final result = await _paymentRepo.makePayment(
      PaymentIntentRequestBody(
        (totalPrice.toInt() * 100).toString(),
        'EGP',
        CacheHelper.getString(key: 'customer_id'),
      ),
    );
    result.when(
      success: (response) {
        emitAddOrderState();
      },
      failure: (message) {
        emit(
          const CheckoutState.addOrderFailure(
            'Failed to order the products',
          ),
        );
      },
    );
  }
}
