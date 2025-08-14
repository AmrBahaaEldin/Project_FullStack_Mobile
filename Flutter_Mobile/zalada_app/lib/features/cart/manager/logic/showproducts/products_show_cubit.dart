import 'package:bloc/bloc.dart';
import 'package:zalada_app/features/cart/manager/logic/showProducts/products_show_state.dart';

import '../../../data/repo/repo_cart_impl.dart';

class ProductsShowCubit extends Cubit<ProductsShowState> {
  ProductsShowCubit(this.repoCart) : super(ProductsShowInitial());
  final RepoCartImpl repoCart;

  void fetchAllProducts() async {
    emit(ProductsShowLoading());
    final result = await repoCart.fetchAllProducts();
    result.fold(
      (failure) {
        return emit(ProductsShowFailure(failure: failure));
      },
      (userCartModel) {
        return emit(ProductsShowLoaded(userCartModel: userCartModel));
      },
    );
  }
}
