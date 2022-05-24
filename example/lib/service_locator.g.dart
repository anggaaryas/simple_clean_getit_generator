import 'package:get_it/get_it.dart';

import 'package:example/Account/data/data_sources/remote.dart';
import 'package:example/Account/domain/repositories/auth.dart';
import 'package:example/Account/domain/repositories/user_info.dart';
import 'package:example/Account/data/repositories/local.dart';
import 'package:example/Account/data/repositories/remote.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void init() {


    // RemoteDataSource
    getIt.registerSingleton(RemoteDataSource());


    // AuthRepository, UserInfoRepository, 
    getIt.registerSingleton<AuthRepository>(LocalRepository(), instanceName: 'Local');
    getIt.registerSingleton<UserInfoRepository>(LocalRepository(), instanceName: 'Local');


    // AuthRepository, UserInfoRepository, 
    getIt.registerSingleton<AuthRepository>(RemoteRepository(), instanceName: 'Remote');
    getIt.registerSingleton<UserInfoRepository>(RemoteRepository(), instanceName: 'Remote');


  }
}
