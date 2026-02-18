import 'package:hotelapp/core/Di/get_it.dart';
import 'package:hotelapp/core/utils/register_lazy_if_not_registered.dart';
import 'package:hotelapp/feature/auth/login/data/repo_impl/login_repo_impl.dart';
import 'package:hotelapp/feature/auth/login/domain/repo/login_repo.dart';
import 'package:hotelapp/feature/auth/login/domain/use_case/login_use_case.dart';
import 'package:hotelapp/feature/auth/login/presentation/logic/login_cubit.dart';

void loginScreenDi() {
  if (getIt.isRegistered<LoginCubit>()) return;

  registerLazyIfNotRegistered<LoginRepo>(
    () => LoginRepoImpl(remoteDataSource: getIt()),
  );
  registerLazyIfNotRegistered<LoginUseCase>(
    () => LoginUseCase(loginRepo: getIt<LoginRepo>()),
  );

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
