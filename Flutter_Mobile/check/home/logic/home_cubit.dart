// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:e_commerce_app/core/network/dio_helper.dart';
// import 'package:e_commerce_app/core/network/endpoints.dart';
// import 'package:e_commerce_app/core/network/new_api.dart';
// import 'package:e_commerce_app/core/network/new_end_points.dart';
// import 'package:e_commerce_app/features/home/data/home_model.dart';
// import 'package:e_commerce_app/features/home/logic/home_cubit.dart';
// import 'package:e_commerce_app/features/home/logic/home_state.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';



// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());
//   static HomeCubit get(context) => BlocProvider.of(context);

//   List<HomeModel> homeModel = [];
//   Set<int> favoriteProducts = {};

//   Future<void> getDataHome() async {
//     try {
//       emit(HomeLoading());
//       Response response = await DioHelper.getData(
//           url: Endpoints.productsEndpoint);

//       if (response.data is Map<String, dynamic>) {
//         homeModel = (response.data as List)
//             .map((item) => HomeModel.fromJson(item))
//             .toList();
//       }
//       else if (response.data is List) {
//         homeModel =
//             homeModel = (response.data as List)
//             .cast<Map<String, dynamic>>() // ✅ تحويل `List<dynamic>` إلى `List<Map<String, dynamic>>`
//             .map((item) => HomeModel.fromJson(item))
//             .toList();
//       }



//       emit(HomeSuccess(homeModel));
//     }
//     catch (e) {
//       emit(HomeError( e.toString()));
//     }
//   }


//   void changeFav(int index) {
//     homeModel[index].isFav = !homeModel[index].isFav;
//     emit(HomeISFav());
//   }

//   List<HomeModel> getFavorites() {
//     return homeModel.where((product) => product.isFav).toList();
//   }





// }


