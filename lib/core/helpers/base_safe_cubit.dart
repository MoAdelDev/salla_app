import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseSafeCubit<T> extends Cubit<T> {
  BaseSafeCubit(super.state);

  bool isClose = false;
  @override
  Future<void> close() {
    isClose = true;
    return super.close();
  }

  void safeEmit(T state) {
    if (!isClose) {
      emit(state);
    }
  }
}
