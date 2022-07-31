// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:manek/app.dart' as _i3;
import 'package:manek/database/database.dart' as _i5;
import 'package:manek/screens/cart/cart_screen_vm.dart' as _i7;
import 'package:manek/screens/home/home_screen_vm.dart' as _i8;
import 'package:manek/services/network_services.dart' as _i6;
import 'package:manek/setup.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.App>(() => _i3.App(key: get<_i4.Key>()));
  gh.singleton<_i5.DatabaseService>(registerModule.database);
  gh.singleton<_i6.INetworkService<dynamic>>(registerModule.network);
  gh.factory<_i4.Key>(() => registerModule.key);
  gh.factory<_i7.CartScreenViewmodel>(() =>
      _i7.CartScreenViewmodel(databaseService: get<_i5.DatabaseService>()));
  gh.factory<_i8.HomeScreenViewmodel>(() => _i8.HomeScreenViewmodel(
      networkService: get<_i6.INetworkService<dynamic>>(),
      databaseService: get<_i5.DatabaseService>()));
  return get;
}

class _$RegisterModule extends _i9.RegisterModule {
  @override
  _i4.UniqueKey get key => _i4.UniqueKey();
}
