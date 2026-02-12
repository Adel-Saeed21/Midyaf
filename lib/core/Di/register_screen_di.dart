import 'package:hotelapp/core/Di/get_it.dart';
import 'package:hotelapp/core/utils/register_lazy_if_not_registered.dart';
import 'package:hotelapp/feature/auth/register/data/repo_impl/register_repo_impl.dart';
import 'package:hotelapp/feature/auth/register/domain/repo/register_repo.dart';
import 'package:hotelapp/feature/auth/register/domain/use_cases/register_use_case.dart';
import 'package:hotelapp/feature/auth/register/presentation/logic/register_cubit.dart';

void registerScreenDi() {
  if (getIt.isRegistered<RegisterCubit>()) return;

  registerLazyIfNotRegistered<RegisterRepo>(() => RegisterRepoImpl(getIt()));

  registerLazyIfNotRegistered<RegisterUseCase>(
    () => RegisterUseCase(registerRepo: getIt<RegisterRepo>()),
  );

  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
}
