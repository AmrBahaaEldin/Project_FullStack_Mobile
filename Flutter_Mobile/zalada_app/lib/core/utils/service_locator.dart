// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:zalada_app/core/utils/api_service.dart';
// import 'package:zalada_app/features/auth/data/repo/repo_register_impl.dart';
// // this copy of the service locator is used to register dependencies in the app
// // it is used to provide instances of classes throughout the app

// final getIt = GetIt.instance;
// void setup() {
//   getIt.registerSingleton<ApiService>(ApiService(Dio()));
//   getIt.registerSingleton<RepoRegisterImpl>(
//     RepoRegisterImpl(getIt<ApiService>()),
//   );
// }
