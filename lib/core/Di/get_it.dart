import 'package:get_it/get_it.dart';
import 'package:hotelapp/core/data_source/remote_data_source.dart';
import 'package:hotelapp/core/networking/network_service.dart';
import 'package:hotelapp/core/utils/register_lazy_if_not_registered.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerLazySingleton<NetworkService>(() => NetworkServiceImp());
  registerLazyIfNotRegistered<RemoteDataSource>(
    () => RemoteDataSourceImpl(getIt<NetworkService>()),
  );
}
