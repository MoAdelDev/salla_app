import 'package:bloc/bloc.dart';
import 'package:salla_app/features/checkout/data/repos/promo_code_repo.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final PromoCodeRepo _promoCodeRepo;
  CheckoutCubit(
    this._promoCodeRepo,
  ) : super(const CheckoutState.initial());

  bool isPromoCodeApplyLoading = false;

  void emitPromoCodeState() async {
    final result = await _promoCodeRepo.applyPromoCode();
    isPromoCodeApplyLoading = true;
    emit(const CheckoutState.applyPromoCodeLoading());
    result.when(
      success: (response) {
        emit(CheckoutState.applyPromoCodeSuccess(response.message));
      },
      failure: (message) {
        emit(CheckoutState.applyPromoCodeFailure(message));
      },
    );
    isPromoCodeApplyLoading = false;
  }
}
