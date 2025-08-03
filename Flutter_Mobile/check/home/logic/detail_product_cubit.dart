

// import 'dart:ffi';

// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:e_commerce_app/core/constants/app_color.dart';
// import 'package:e_commerce_app/core/network/dio_helper.dart';
// import 'package:e_commerce_app/core/network/endpoints.dart';
// import 'package:e_commerce_app/features/home/data/detail_product_model.dart';
// import 'package:e_commerce_app/features/home/data/home_model.dart';
// import 'package:e_commerce_app/features/home/logic/detail_product_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class DetailProductCubit extends Cubit<DetailProductState> {
//   DetailProductCubit() : super(DetailProductInitial());
//   static DetailProductCubit get(context) => BlocProvider.of(context);
//   DetailProductModel? detailProductModel;
//  List<ViewProduct> viewProducts=[];

//   Future<void> getDetailProduct(String id) async {
//     emit(DetailProductLoading());
//     try {
//       Response response = await DioHelper.getData(url: '/products/$id');
//       if (response.statusCode == 200 && response.data != null) {
//         detailProductModel = DetailProductModel.formJson(response.data);
//         emit(DetailProductLoaded(detailProduct: detailProductModel!));
//       } else {
//         emit(DetailProductError(error: "Failed to fetch product details"));
//       }
//     } catch (e) {
//       print("eeeeeeeeeeee${e.toString()}");
//       emit(DetailProductError(error: e.toString()));
//     }
//   }
//   Future<void> getProducts() async {
//     emit(ProductsLoading());
//     try {
//       Response response = await DioHelper.getData(url: Endpoints.productsEndpoint);
//       if (response.statusCode == 200 && response.data is List) {
//         viewProducts = (response.data as List)
//             .map((e) => ViewProduct.fromJson(e))
//             .toList();

//         emit(ProductsLoaded(viewProducts: viewProducts));
//       } else {
//         emit(ProductsError(error: "Failed to fetch products list"));
//       }
//     } catch (e) {
//       emit(ProductsError(error: e.toString()));
//     }
//   }

//   Future<void> getAllDetailProductAndProducts({required String id}) async {
//     emit(DetailProductLoading());
//     try {
//       await
//       Future.wait([
//         getDetailProduct(id),
//         getProducts(),
//       ]);
//       emit(DetailProductLoaded());
//     } catch (e) {
//       emit(DetailProductError(error: e.toString()));
//     }
//   }
// bool isChange =false;
//   Color colorG=Colors.white;
//   Color colorB=Colors.white;
//   Color colorL=Colors.white;


//   void geryColor(){
//     isChange = !isChange;
//    colorG =isChange? Colors.grey : Colors.white;
//     emit(GreyColorState());
//   }
//   void brownColor(){
//     isChange = !isChange;
//     colorB =isChange? Colors.brown.shade100 : Colors.white;
//     emit(BrownColorState());
//   }

//   void lowGeryColor(){
//     isChange = !isChange;
//     colorL =isChange? Colors.grey.shade200 : Colors.white;
//     emit(LowGreyColorState());
//   }


// }
