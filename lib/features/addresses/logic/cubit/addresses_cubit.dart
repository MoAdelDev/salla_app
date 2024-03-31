import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/addresses/data/repos/addresses_repo.dart';
import 'package:salla_app/features/addresses/logic/cubit/addresses_state.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

class AddressesCubit extends BaseSafeCubit<AddressesState> {
  final AddressesRepo _addressesRepo;
  AddressesCubit(this._addressesRepo) : super(const AddressesState.initial());

  List<AddressModel>? addresses;
  void emitAddressState() async {
    safeEmit(const AddressesState.loading());
    final response = await _addressesRepo.getAddresses();
    response.when(
      success: (data) {
        addresses = data.data?.addresses;
        safeEmit(AddressesState.success(addresses ?? []));
      },
      failure: (error) {
        safeEmit(AddressesState.failure(error));
      },
    );
  }

  void emitDeleteAddress(int addressId) async {
    safeEmit(const AddressesState.loading());
    final response = await _addressesRepo.deleteAddress(addressId);
    response.when(
      success: (data) {
        addresses?.removeWhere((element) => element.id == addressId);
        safeEmit(AddressesState.success(addresses ?? []));
      },
      failure: (error) {
        safeEmit(AddressesState.failure(error));
      },
    );
  }
}
