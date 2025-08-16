import 'package:bloc/bloc.dart';
import 'package:zalada_app/features/cart/data/repo/repo_cart_impl.dart';

import '../../data/model/cart_add_input_model.dart';
import 'cart_add_state.dart';

class CartAddCubit extends Cubit<CartAddState> {
  CartAddCubit(this.repoCartImpl) : super(CartAddInitial());
  RepoCartImpl repoCartImpl;

  void addProductToCart(CartAddInputModel cartAddInputModel) async {
    emit(CartAddLoading());
    final result = await repoCartImpl.fetchAddCart(cartAddInputModel);
    result.fold(
      (failure) => emit(CartAddFailure(failure: failure)),
      (data) => emit(CartAddLoaded(cartAddModel: data)),
    );
  }

  int quantity = 1;

  void quantityProduct(String typeQuantity) {
    switch (typeQuantity) {
      case "plus":
        quantity++;
        emit(QuantityProduct());
        break;
      case "minus":
        if (quantity > 1) {
         quantity--;
        } else {
          quantity = 1;
        }
        emit(QuantityProduct());
        break;
    }
  }
}
