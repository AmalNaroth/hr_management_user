// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/user_side/application/bloc/dash_board_bloc.dart' as _i7;
import '../../features/user_side/application/login/login_bloc.dart' as _i8;
import '../../features/user_side/domain/login/login_services.dart' as _i3;
import '../../features/user_side/domain/user/user_services.dart' as _i5;
import '../../features/user_side/infrastructure/login_repository.dart' as _i4;
import '../../features/user_side/infrastructure/user_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.LoginServices>(() => _i4.LoginRepository());
  gh.lazySingleton<_i5.UserServises>(() => _i6.UserRepository());
  gh.factory<_i7.DashBoardBloc>(
      () => _i7.DashBoardBloc(get<_i5.UserServises>()));
  gh.factory<_i8.LoginBloc>(() => _i8.LoginBloc(get<_i3.LoginServices>()));
  return get;
}
