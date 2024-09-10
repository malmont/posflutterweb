// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:pos_flutter/core/config/environment_config.dart' as _i1044;
import 'package:pos_flutter/core/config/environment_repository.dart' as _i310;
import 'package:pos_flutter/core/network/network_info.dart' as _i40;
import 'package:pos_flutter/core/services/api/product_api_client.dart' as _i303;
import 'package:pos_flutter/core/services/api/user_api_client.dart' as _i324;
import 'package:pos_flutter/core/services/data_sources/local/product_local_data_source.dart'
    as _i628;
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart'
    as _i381;
import 'package:pos_flutter/core/services/data_sources/remote/product_remote-data_sourceImpl.dart'
    as _i308;
import 'package:pos_flutter/core/services/data_sources/remote/user_remote_data_source.dart'
    as _i1036;
import 'package:pos_flutter/di/register_module.dart' as _i93;
import 'package:pos_flutter/features/authentification/application/blocs/auth_bloc.dart'
    as _i644;
import 'package:pos_flutter/features/authentification/application/viewmodels/signin_viewmodel.dart'
    as _i229;
import 'package:pos_flutter/features/authentification/domain/repositories/auth_repository.dart'
    as _i40;
import 'package:pos_flutter/features/authentification/domain/usecases/is_signed_usecase.dart'
    as _i935;
import 'package:pos_flutter/features/authentification/domain/usecases/sign_in_usecase.dart'
    as _i112;
import 'package:pos_flutter/features/authentification/domain/usecases/sign_out_usecase.dart'
    as _i360;
import 'package:pos_flutter/features/authentification/infrastucture/repositories/auth_repository_impl.dart'
    as _i750;
import 'package:pos_flutter/features/products/application/blocs/product_bloc.dart'
    as _i117;
import 'package:pos_flutter/features/products/domain/repositories/product_repository.dart'
    as _i116;
import 'package:pos_flutter/features/products/domain/usecases/get_product_usecase.dart'
    as _i323;
import 'package:pos_flutter/features/products/infrastucture/repositories/product_repository_impl.dart'
    as _i980;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i519.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i310.EnvironmentRepository>(
        () => _i310.EnvironmentRepository());
    gh.lazySingleton<_i381.UserLocalDataSource>(
        () => _i381.UserLocalDataSourceImpl(
              sharedPreferences: gh<_i460.SharedPreferences>(),
              secureStorage: gh<_i558.FlutterSecureStorage>(),
            ));
    gh.lazySingleton<_i40.NetworkInfo>(
        () => _i40.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i628.ProductLocalDataSource>(() =>
        _i628.ProductLocalDataSourceImpl(
            sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i1044.EnvironmentConfig>(
        () => _i1044.EnvironmentConfig(gh<_i310.EnvironmentRepository>()));
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio(
          gh<_i381.UserLocalDataSource>(),
          gh<_i1044.EnvironmentConfig>(),
        ));
    gh.lazySingleton<_i324.UserApiClient>(
        () => registerModule.userApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i303.ProductApiClient>(
        () => registerModule.productApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i1036.UserRemoteDataSource>(
        () => _i1036.UserRemoteDataSourceImpl(
              apiClient: gh<_i324.UserApiClient>(),
              userLocalDataSource: gh<_i381.UserLocalDataSource>(),
            ));
    gh.lazySingleton<_i308.ProductRemoteDataSource>(() =>
        _i308.ProductRemoteDataSourceImpl(
            apiClient: gh<_i303.ProductApiClient>()));
    gh.lazySingleton<_i40.AuthRepository>(() => _i750.AuthRepositoryImpl(
          remoteDataSource: gh<_i1036.UserRemoteDataSource>(),
          localDataSource: gh<_i381.UserLocalDataSource>(),
          networkInfo: gh<_i40.NetworkInfo>(),
        ));
    gh.lazySingleton<_i116.ProductRepository>(() => _i980.ProductRepositoryImpl(
          remoteDataSource: gh<_i308.ProductRemoteDataSource>(),
          localDataSource: gh<_i628.ProductLocalDataSource>(),
          networkInfo: gh<_i40.NetworkInfo>(),
        ));
    gh.lazySingleton<_i323.GetProductUseCase>(
        () => _i323.GetProductUseCase(gh<_i116.ProductRepository>()));
    gh.lazySingleton<_i935.CheckTokenValidityUseCase>(
        () => _i935.CheckTokenValidityUseCase(gh<_i40.AuthRepository>()));
    gh.lazySingleton<_i112.SignInUseCase>(
        () => _i112.SignInUseCase(gh<_i40.AuthRepository>()));
    gh.lazySingleton<_i360.SignOutUseCase>(
        () => _i360.SignOutUseCase(gh<_i40.AuthRepository>()));
    gh.factory<_i644.AuthBloc>(() => _i644.AuthBloc(
          checkTokenValidityUseCase: gh<_i935.CheckTokenValidityUseCase>(),
          signInUseCase: gh<_i112.SignInUseCase>(),
          localDataSource: gh<_i381.UserLocalDataSource>(),
          signOutUseCase: gh<_i360.SignOutUseCase>(),
        ));
    gh.factory<_i117.ProductBloc>(
        () => _i117.ProductBloc(gh<_i323.GetProductUseCase>()));
    gh.factory<_i229.SignInViewModel>(
        () => _i229.SignInViewModel(gh<_i644.AuthBloc>()));
    return this;
  }
}

class _$RegisterModule extends _i93.RegisterModule {}
