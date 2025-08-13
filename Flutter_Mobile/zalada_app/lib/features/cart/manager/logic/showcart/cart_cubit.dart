import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zalada_app/core/utils/cache_db_app.dart';
import 'package:zalada_app/features/cart/data/repo/repo_cart.dart';
import 'package:zalada_app/features/cart/manager/logic/showcart/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.repoCart) : super(CartInitial());
  final RepoCart repoCart;
  void fetchCart() async {
    emit(CartLoading());
    final result = await repoCart.fetchCartUser(
      CacheApp.getData(key: "UserId"),
    );
    result.fold(
      (failure) {
        return emit(CartFailure(failure: failure));
      },
      (userCartModel) {
        return emit(CartLoaded(userCartModel: userCartModel));
      },
    );
  }
 
}

