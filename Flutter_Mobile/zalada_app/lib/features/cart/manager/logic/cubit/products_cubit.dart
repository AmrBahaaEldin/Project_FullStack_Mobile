import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zalada_app/features/cart/data/repo/repo_cart_impl.dart';
import 'package:zalada_app/features/cart/manager/logic/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
   ProductsCubit(this.repoCart) : super(ProductsInitial());
  final RepoCartImpl repoCart;
  void fetchAllProducts() async {
    emit(ProductsLoading());
    final result = await repoCart.fetchAllProducts();
    result.fold(
      (failure) {
        return emit(ProductsFailure(failure: failure));
      },
      (userCartModel) {
        return emit(ProductsLoaded(userCartModel: userCartModel));
      },
    );
  }
}
