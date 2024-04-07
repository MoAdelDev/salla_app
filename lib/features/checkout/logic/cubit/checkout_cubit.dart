import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/notification_helper.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/payment/stripe/payment_intent_request_body.dart';
import 'package:salla_app/features/addresses/data/repos/addresses_repo.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/checkout/data/models/add_order_request_body.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';
import 'package:salla_app/features/checkout/data/models/paypal_transaction_model.dart';
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
    if (addressSelectedId == 0 || addresses == null) {
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
      int randomId = Random().nextInt(1000);
      NotificationHelper.showNotification(
        title: 'Order Requested',
        body: response.message,
        id: randomId,
      );
    }, failure: (message) {
      safeEmit(CheckoutState.addOrderFailure(message));
    });
  }

  void emitStripeState(double totalPrice) async {
    if (addressSelectedId == 0 || addresses == null) {
      showToast('Please select or add new address');
      return;
    }
    safeEmit(const CheckoutState.addOrderLoading());
    final String customerId = await CacheHelper.getString(key: 'customer_id');

    final result = await _paymentRepo.makeStripePayment(
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

  void emitPaymobState(
    double totalPrice,
    List<CartProductModel> products,
  ) async {
    if (addressSelectedId == 0 || addresses == null) {
      showToast('Please select or add new address');
      return;
    }
    safeEmit(const CheckoutState.addOrderLoading());

    AddressModel addressModel =
        addresses!.singleWhere((element) => element.id == addressSelectedId);
    final result = await _paymentRepo.makePaymobPayment(
      totalPrice,
      products,
      addressModel,
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

  void emitPayPalState({
    required totalPrice,
    required List<CartProductModel> products,
    required BuildContext context,
  }) async {
    if (addressSelectedId == 0 || addresses == null) {
      showToast('Please select or add new address');
      return;
    }
    safeEmit(const CheckoutState.addOrderLoading());
    AmountDetailsModel amountDetails = AmountDetailsModel(
      '${(totalPrice / 50).round()}',
      '0',
      '0',
    );
    AmountModel amount = AmountModel(
      '${(totalPrice / 50).round()}',
      'USD',
      amountDetails,
    );
    AddressModel addressModel =
        addresses!.singleWhere((element) => element.id == addressSelectedId);

    PayPalShipphingAddress shipphingAddress = PayPalShipphingAddress(
      addressModel.name,
      addressModel.details,
      '',
      addressModel.city,
      '',
      AppData.userModel.phone,
      'EG',
      addressModel.region,
    );

    List<PayPalOrderModel> items = products
        .map(
          (e) => PayPalOrderModel(
            e.product.name,
            e.quantity.toString(),
            '${(e.product.price / 50 as double).round()}',
            'USD',
          ),
        )
        .toList();
    PayPalItems payPalItems = PayPalItems(
      items,
      shipphingAddress,
    );
    PayPalTransactionModel transaction = PayPalTransactionModel(
      'Pay via PayPal Checkout',
      payPalItems,
      amount,
    );
    bool isSuccess = false;
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: dotenv.env['PAYPAL_CLIENT_ID'],
          secretKey: dotenv.env['PAYPAL_SECRET_KEY'],
          transactions: [
            transaction.toJson(),
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            context.pop();
            isSuccess = true;
          },
          onError: (error) {
            context.pop();
            isSuccess = false;
          },
          onCancel: () {
            context.pop();
            isSuccess = false;
          },
        ),
      ),
    )
        .then((value) {
      if (isSuccess) {
        emitAddOrderState();
      } else {
        safeEmit(
          const CheckoutState.addOrderFailure('Payment cancelled'),
        );
      }
    });
  }
}
