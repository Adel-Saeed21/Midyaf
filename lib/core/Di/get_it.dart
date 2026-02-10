import 'package:get_it/get_it.dart';
import 'package:hotelapp/core/networking/network_service.dart';


final getIt = GetIt.instance;

void setupDi() {
  // Network Service
  getIt.registerLazySingleton<NetworkService>(() => NetworkServiceImp());

 
}