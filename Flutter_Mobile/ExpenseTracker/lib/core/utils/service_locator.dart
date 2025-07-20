
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  // getIt.registerSingleton<ApiServivce>(ApiServivce(Dio()));
  //
  // getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
  //   getIt.get<ApiServivce>(),
  // ));


  // getIt.registerSingleton<AppModel>(AppModel());

  //getIt.registerSingleton<AuthRepo>(AuthRepo(getIt.get<ApiServivce>()));

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}

//

// class AuthRepo {
//   final ApiServivce apiServivce;
//   AuthRepo(this.apiServivce);
// }
