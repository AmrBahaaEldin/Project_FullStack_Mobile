import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/endpoints.dart';
import 'package:e_commerce_app/features/home/data/home_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List<HomeModel> products = [];
  List<HomeModel> searchedProducts = [];
  List<HomeModel> filteredProducts = [];


  void getProducts({String? searchQuery}) async {
    emit(SearchLoading());
    try {
      Response response = await DioHelper.getData(url: Endpoints.productsEndpoint);
      print("__________________${response.data}++++++++++++++++++++++++++++++");
      if (response.statusCode == 200 && response.data != null) {
        products = (response.data as List)
            .map((e) => HomeModel.fromJson(e))
            .toList();

        if (searchQuery != null && searchQuery.isNotEmpty) {
          searchProducts(searchQuery);
        } else {
          emit(SearchSuccess(searchedProducts: products));
        }
      } else {
        emit(SearchError("Failed"));
      }
    } catch (error) {
      print("__________________$error++++++++++++++++++++++++++++++");
      emit(SearchError(error.toString()));
    }
  }

  void searchProducts(String query) {
    emit(SearchLoading());

    searchedProducts = products
        .where((product) =>
        product.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchSuccess(searchedProducts: searchedProducts));
  }
  void filterProductsByPrice(double minPrice, double maxPrice) {
    emit(SearchLoading());

    filteredProducts = searchedProducts.where((product) {
      return product.price! >= minPrice && product.price! <= maxPrice;
    }).toList();

    emit(SearchSuccess(searchedProducts: filteredProducts));
  }
}


