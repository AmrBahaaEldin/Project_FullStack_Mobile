import 'package:bloc/bloc.dart';
import 'package:zalada_app/features/payment/data/repo/repo_create_payment_impl.dart';
import 'package:zalada_app/features/payment/manager/logic/payment_purchase/cubit/payment_purchase_state.dart';

class PaymentPurchaseCubit extends Cubit<PaymentPurchaseState> {
  PaymentPurchaseCubit(this.paymentImpl) : super(PaymentPurchaseInitial());
  final RepoCreatePaymentImpl paymentImpl;
  Future makePayment({
    required String customerName,
    required String amount,
  }) async {
    emit(PaymentPurchaseLoading());
    final result = await paymentImpl.makePayment(
      amount: amount,
      customerName: customerName
    );
    result.fold(
      (l) => emit(PaymentPurchaseFailure(failure: l)),
      (r) => emit(PaymentPurchaseLoaded()),
    );
  }
}
