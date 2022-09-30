// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import 'services/app.module.dart' as _i9;
import 'services/services.dart' as _i3;
import 'user/bloc/user_bloc.dart' as _i8;
import 'user/repository/auth_api.dart' as _i6;
import 'user/repository/i_auth_api.dart' as _i5; // ignore_for_file: unnecessary_lambdas

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
  final appModule = _$AppModule();
  gh.singleton<_i4.FlutterSecureStorage>(appModule.secureStorage);
  gh.factory<_i5.IAuthApi>(() => _i6.AuthApi());
  //gh.factoryAsync<_i7.SharedPreferences>(() => appModule.sharedPreferences);
  gh.factory<_i8.UserBloc>(() => _i8.UserBloc(get<_i5.IAuthApi>()));
  return get;
}

class _$AppModule extends _i9.AppModule {}
