import 'package:get_it/get_it.dart';
import 'package:gradution_app/Core/Api/api.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:provider/provider.dart';



GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  //locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
//  locator.registerLazySingleton(() => APIService());


//  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
//  locator.registerFactory(() => CommentsModel());
}
