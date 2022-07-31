import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:manek/database/database.dart';
import 'package:manek/services/dio_services.dart';
import 'package:manek/services/network_call.dart';
import 'package:manek/services/network_services.dart';
import 'package:manek/setup.config.dart';

GetIt getIt = GetIt.instance;

T locateService<T extends Object>() => getIt.get<T>();

Future<void> configureDependencies() async => $initGetIt(getIt);

// Using a register module (for third party dependencies)
// if you declare a module member as a method instead of a simple accessor, injectable
// will treat it as a factory method, meaning it will inject it's parameters as it would with a regular constructor.
// The same way if you annotate an injected param with @factoryParam injectable will treat it as a factory param.
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
@module
abstract class RegisterModule {
  final _client = ApiHelper.createDio();

  @Injectable(as: Key)
  UniqueKey get key;

  @singleton
  INetworkService get network => NetworkCall(client: _client);

  @singleton
  DatabaseService get database => DatabaseService();
}
