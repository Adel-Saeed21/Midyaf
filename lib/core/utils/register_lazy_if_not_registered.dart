
import 'package:hotelapp/core/Di/get_it.dart';

void registerLazyIfNotRegistered<T extends Object>(T Function() factory) {
  if (!getIt.isRegistered<T>()) {
    getIt.registerLazySingleton<T>(factory);
  }
}
