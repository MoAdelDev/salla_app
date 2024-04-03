import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/stripe/payment_intent_request_body.dart';
import 'package:salla_app/features/addresses/data/repos/addresses_repo.dart';
import 'package:salla_app/features/checkout/data/models/add_order_request_body.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';
import 'package:salla_app/features/checkout/data/models/promo_code_request_body.dart';
import 'package:salla_app/features/checkout/data/repos/add_order_repo.dart';
import 'package:salla_app/features/checkout/data/repos/payment_repo.dart';
import 'package:salla_app/features/checkout/data/repos/promo_code_repo.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';

class CheckoutCubit extends BaseSafeCubit<CheckoutState> {
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
    if (promoCodeController.text.isEmpty) {
      isPromoCodeApplyLoading = false;
      safeEmit(const CheckoutState.applyPromoCodeFailure('Please enter code'));
    } else {
      safeEmit(const CheckoutState.applyPromoCodeLoading());
      if (promoCodeController.text.isNumber()) {
        final result = await _promoCodeRepo.applyPromoCode(
          PromoCodeRequestBody(code: int.parse(promoCodeController.text)),
        );
        result.when(
          success: (response) {
            safeEmit(CheckoutState.applyPromoCodeSuccess(response.message));
          },
          failure: (message) {
            safeEmit(CheckoutState.applyPromoCodeFailure(message));
          },
        );
        isPromoCodeApplyLoading = false;
      } else {
        isPromoCodeApplyLoading = false;
        safeEmit(
            const CheckoutState.applyPromoCodeFailure('Please enter number'));
      }
    }
  }

  int addressSelectedId = 0;
  List<AddressModel>? addresses;
  void emitAddressesState() async {
    safeEmit(const CheckoutState.loading());
    final result = await _addressesRepo.getAddresses();
    result.when(
      success: (response) {
        addresses = response.data?.addresses;
        if (addresses != null && addresses!.isNotEmpty) {
          addressSelectedId = addresses!.first.id;
        }
        safeEmit(CheckoutState.success(response.data?.addresses ?? []));
      },
      failure: (message) {
        safeEmit(CheckoutState.failure(message));
      },
    );
  }

  void emitSelectAddressState(int addressId) {
    safeEmit(const CheckoutState.initial());
    addressSelectedId = addressId;
    safeEmit(const CheckoutState.selectItem());
  }

  int paymentMethodSelected = 1;
  void emitSelectPaymentState(int paymentSelected) {
    safeEmit(const CheckoutState.initial());
    paymentMethodSelected = paymentSelected;
    safeEmit(const CheckoutState.selectItem());
  }

  void emitAddOrderState() async {
    if (addressSelectedId == 0) {
      showToast('Please select or add new address');
      return;
    }
    safeEmit(const CheckoutState.addOrderLoading());
    final result = await _addOrderRepo.addOrder(
      AddOrderRequestBody(
        addressId: addressSelectedId,
        paymentMethod: paymentMethodSelected,
        usePoints: false,
      ),
    );
    result.when(success: (response) {
      safeEmit(CheckoutState.addOrderSuccess(response.message));
    }, failure: (message) {
      safeEmit(CheckoutState.addOrderFailure(message));
    });
  }

  void emitPaymentState(double totalPrice) async {
    safeEmit(const CheckoutState.addOrderLoading());
    if (addressSelectedId == 0) {
      showToast('Please select or add new address');
      return;
    }
    final String customerId = await CacheHelper.getString(key: 'customer_id');

    final result = await _paymentRepo.makePayment(
      PaymentIntentRequestBody(
        (totalPrice.toInt() * 100).toString(),
        'EGP',
        customerId,
      ),
    );
    result.when(
      success: (response) {
        emitAddOrderState();
      },
      failure: (message) {
        safeEmit(
          CheckoutState.addOrderFailure(message),
        );
      },
    );
  }

  List<String> paymentImages = [
    'assets/images/paymob.png',
    'assets/images/paypal.png',
    'assets/images/stripe.png',
  ];
  int payemntSelected = 0;
  void emitSelectPaymentMethodState(int index) {
    safeEmit(const CheckoutState.initial());
    payemntSelected = index;
    safeEmit(CheckoutState.selectPaymentMethod(index));
  }
}
