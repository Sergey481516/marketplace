// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:marketplace/core/module/api_client/module.dart' as _i612;
import 'package:marketplace/core/module/database/drift_database.dart' as _i186;
import 'package:marketplace/core/module/firebase/firebase.dart' as _i353;
import 'package:marketplace/core/module/local_storage/local_storage.dart'
    as _i793;
import 'package:marketplace/core/module/secure_storage/secure_storage.dart'
    as _i305;
import 'package:marketplace/core/platform/network_info.dart' as _i842;
import 'package:marketplace/features/data/data_sources/local/app_launch/app_launch_datasource.dart'
    as _i213;
import 'package:marketplace/features/data/data_sources/local/favorite/favorite_dao.dart'
    as _i136;
import 'package:marketplace/features/data/data_sources/local/favorite/favorite_local_datasource.dart'
    as _i982;
import 'package:marketplace/features/data/data_sources/local/product/product_dao.dart'
    as _i613;
import 'package:marketplace/features/data/data_sources/local/product/product_local_datasource.dart'
    as _i60;
import 'package:marketplace/features/data/data_sources/local/secure_storage/auth_secure_storage.dart'
    as _i263;
import 'package:marketplace/features/data/data_sources/remote/auth_datasource.dart'
    as _i549;
import 'package:marketplace/features/data/data_sources/remote/dictionary_datasource.dart'
    as _i464;
import 'package:marketplace/features/data/data_sources/remote/notification_datasource.dart'
    as _i989;
import 'package:marketplace/features/data/data_sources/remote/product_datasource.dart'
    as _i69;
import 'package:marketplace/features/data/repository/app_launch_repository_impl.dart'
    as _i643;
import 'package:marketplace/features/data/repository/auth_repository_impl.dart'
    as _i531;
import 'package:marketplace/features/data/repository/dictionary_repository.dart'
    as _i162;
import 'package:marketplace/features/data/repository/favorite_repository_impl.dart'
    as _i415;
import 'package:marketplace/features/data/repository/notification_repository_impl.dart'
    as _i708;
import 'package:marketplace/features/data/repository/product_repository_impl.dart'
    as _i915;
import 'package:marketplace/features/domain/repository/app_launch_repositoty.dart'
    as _i32;
import 'package:marketplace/features/domain/repository/auth_repository.dart'
    as _i451;
import 'package:marketplace/features/domain/repository/dictionary_repository.dart'
    as _i399;
import 'package:marketplace/features/domain/repository/favorite_repository.dart'
    as _i82;
import 'package:marketplace/features/domain/repository/notification_repository.dart'
    as _i362;
import 'package:marketplace/features/domain/repository/product_repository.dart'
    as _i187;
import 'package:marketplace/features/domain/usecases/app_launch/check_seen_onboarding.dart'
    as _i924;
import 'package:marketplace/features/domain/usecases/app_launch/set_onboarding_seen.dart'
    as _i103;
import 'package:marketplace/features/domain/usecases/auth/forgot_password.dart'
    as _i734;
import 'package:marketplace/features/domain/usecases/auth/login.dart' as _i536;
import 'package:marketplace/features/domain/usecases/auth/logout.dart' as _i285;
import 'package:marketplace/features/domain/usecases/auth/register.dart'
    as _i869;
import 'package:marketplace/features/domain/usecases/dictionary/fetch_dictionary_use_case.dart'
    as _i254;
import 'package:marketplace/features/domain/usecases/favorite/save_to_favorite_use_case.dart'
    as _i364;
import 'package:marketplace/features/domain/usecases/notification/get_notifications_use_case.dart'
    as _i419;
import 'package:marketplace/features/domain/usecases/product/fetch_product_use_case.dart'
    as _i953;
import 'package:marketplace/features/domain/usecases/product/get_product_use_case.dart'
    as _i342;
import 'package:marketplace/features/presentation/bloc/auth/auth_bloc.dart'
    as _i420;
import 'package:marketplace/features/presentation/bloc/auth/forgot_password_bloc.dart'
    as _i0;
import 'package:marketplace/features/presentation/bloc/auth/login_bloc.dart'
    as _i965;
import 'package:marketplace/features/presentation/bloc/auth/register_bloc.dart'
    as _i580;
import 'package:marketplace/features/presentation/bloc/favorite/favorite_cubit.dart'
    as _i95;
import 'package:marketplace/features/presentation/bloc/init/init_bloc.dart'
    as _i222;
import 'package:marketplace/features/presentation/bloc/notification/notification_cubit.dart'
    as _i563;
import 'package:marketplace/features/presentation/bloc/product/bloc.dart'
    as _i767;
import 'package:marketplace/features/presentation/bloc/product/product_list_cubit.dart'
    as _i927;
import 'package:marketplace/features/presentation/bloc/product_filter/cubit.dart'
    as _i562;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefsModule = _$SharedPrefsModule();
    final firebaseModule = _$FirebaseModule();
    final secureStorageModule = _$SecureStorageModule();
    final module = _$Module();
    final apiClientModule = _$ApiClientModule();
    await gh.factoryAsync<_i460.SharedPreferencesWithCache>(
      () => sharedPrefsModule.prefs,
      preResolve: true,
    );
    gh.factory<_i562.ProductFilterCubit>(() => _i562.ProductFilterCubit());
    gh.singleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.singleton<_i974.FirebaseFirestore>(
      () => firebaseModule.firebaseFirestore,
    );
    gh.lazySingleton<_i186.AppDatabase>(() => _i186.AppDatabase());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.secureStorage,
    );
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => module.connectionChecker,
    );
    gh.lazySingleton<_i361.Dio>(
      () => apiClientModule.productApiClient(),
      instanceName: 'ProductApiClient',
    );
    gh.lazySingleton<_i213.AppLaunchDatasource>(
      () =>
          _i213.AppLaunchDatasourceImpl(gh<_i460.SharedPreferencesWithCache>()),
    );
    gh.lazySingleton<_i69.ProductRemoteDatasource>(
      () => _i69.ProductRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i549.AuthRemoteDatasource>(
      () => _i549.AuthRemoteDatasourceImpl(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => apiClientModule.notificationApiClient(),
      instanceName: 'NotificationApiClient',
    );
    gh.lazySingleton<_i361.Dio>(
      () => apiClientModule.dictionaryApiClient(),
      instanceName: 'DictionaryApiClient',
    );
    gh.lazySingleton<_i361.Dio>(
      () => apiClientModule.authApiClient(),
      instanceName: 'AuthApiClient',
    );
    gh.lazySingleton<_i842.NetworkInfo>(
      () => _i842.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i32.AppLaunchRepository>(
      () => _i643.AppLaunchRepositoryImpl(gh<_i213.AppLaunchDatasource>()),
    );
    gh.lazySingleton<_i464.DictionaryRemoteDatasource>(
      () => _i464.DictionaryRemoteDatasourceImpl(
        gh<_i361.Dio>(instanceName: 'DictionaryApiClient'),
      ),
    );
    gh.lazySingleton<_i263.AuthSecureStorage>(
      () => _i263.AuthSecureStorage(
        secureStorage: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i451.AuthRepository>(
      () => _i531.AuthRepositoryImpl(
        gh<_i549.AuthRemoteDatasource>(),
        gh<_i263.AuthSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i136.FavoriteDao>(
      () => _i136.FavoriteDao(gh<_i186.AppDatabase>()),
    );
    gh.lazySingleton<_i613.ProductDao>(
      () => _i613.ProductDao(gh<_i186.AppDatabase>()),
    );
    gh.lazySingleton<_i989.NotificationDatasource>(
      () => _i989.NotificationDatasourceImpl(
        gh<_i361.Dio>(instanceName: 'NotificationApiClient'),
      ),
    );
    gh.lazySingleton<_i734.ForgotPassword>(
      () => _i734.ForgotPassword(gh<_i451.AuthRepository>()),
    );
    gh.factory<_i0.ForgotPasswordBloc>(
      () => _i0.ForgotPasswordBloc(gh<_i734.ForgotPassword>()),
    );
    gh.lazySingleton<_i399.DictionaryRepository>(
      () => _i162.DictionaryRepositoryImpl(
        gh<_i464.DictionaryRemoteDatasource>(),
      ),
    );
    gh.lazySingleton<_i60.ProductLocalDatasource>(
      () => _i60.ProductLocalDatasourceImpl(gh<_i613.ProductDao>()),
    );
    gh.lazySingleton<_i924.CheckSeenOnboarding>(
      () => _i924.CheckSeenOnboarding(gh<_i32.AppLaunchRepository>()),
    );
    gh.lazySingleton<_i103.SetOnboardingSeen>(
      () => _i103.SetOnboardingSeen(gh<_i32.AppLaunchRepository>()),
    );
    gh.lazySingleton<_i536.Login>(
      () => _i536.Login(authRepository: gh<_i451.AuthRepository>()),
    );
    gh.lazySingleton<_i285.Logout>(
      () => _i285.Logout(authRepository: gh<_i451.AuthRepository>()),
    );
    gh.lazySingleton<_i869.Register>(
      () => _i869.Register(authRepository: gh<_i451.AuthRepository>()),
    );
    gh.factory<_i965.LoginBloc>(() => _i965.LoginBloc(gh<_i536.Login>()));
    gh.lazySingleton<_i982.FavoriteLocalDatasource>(
      () => _i982.FavoriteLocalDatasourceImpl(gh<_i136.FavoriteDao>()),
    );
    gh.lazySingleton<_i580.RegisterBloc>(
      () => _i580.RegisterBloc(gh<_i869.Register>()),
    );
    gh.lazySingleton<_i187.ProductRepository>(
      () => _i915.ProductRepositoryImpl(
        gh<_i842.NetworkInfo>(),
        gh<_i69.ProductRemoteDatasource>(),
        gh<_i60.ProductLocalDatasource>(),
      ),
    );
    gh.lazySingleton<_i362.NotificationRepository>(
      () =>
          _i708.NotificationRepositoryImpl(gh<_i989.NotificationDatasource>()),
    );
    gh.lazySingleton<_i953.FetchProductList>(
      () => _i953.FetchProductList(
        productRepository: gh<_i187.ProductRepository>(),
      ),
    );
    gh.lazySingleton<_i342.GetProduct>(
      () => _i342.GetProduct(productRepository: gh<_i187.ProductRepository>()),
    );
    gh.lazySingleton<_i254.FetchDictionary>(
      () => _i254.FetchDictionary(gh<_i399.DictionaryRepository>()),
    );
    gh.lazySingleton<_i419.GetNotifications>(
      () => _i419.GetNotifications(gh<_i362.NotificationRepository>()),
    );
    gh.factory<_i927.ProductListCubit>(
      () => _i927.ProductListCubit(
        productRepository: gh<_i187.ProductRepository>(),
        filterCubit: gh<_i562.ProductFilterCubit>(),
        fetchProductList: gh<_i953.FetchProductList>(),
      ),
    );
    gh.lazySingleton<_i82.FavoriteRepository>(
      () => _i415.FavoriteRepositoryImpl(gh<_i982.FavoriteLocalDatasource>()),
    );
    gh.factory<_i420.AuthBloc>(
      () => _i420.AuthBloc(
        gh<_i59.FirebaseAuth>(),
        gh<_i285.Logout>(),
        gh<_i924.CheckSeenOnboarding>(),
        gh<_i103.SetOnboardingSeen>(),
      ),
    );
    gh.singleton<_i222.InitBloc>(
      () => _i222.InitBloc(gh<_i927.ProductListCubit>()),
    );
    gh.factory<_i563.NotificationCubit>(
      () => _i563.NotificationCubit(gh<_i419.GetNotifications>()),
    );
    gh.factory<_i767.ProductBloc>(
      () => _i767.ProductBloc(gh<_i187.ProductRepository>()),
    );
    gh.lazySingleton<_i364.SaveToFavorite>(
      () => _i364.SaveToFavorite(gh<_i82.FavoriteRepository>()),
    );
    gh.factory<_i95.FavoriteCubit>(
      () => _i95.FavoriteCubit(gh<_i82.FavoriteRepository>()),
    );
    return this;
  }
}

class _$SharedPrefsModule extends _i793.SharedPrefsModule {}

class _$FirebaseModule extends _i353.FirebaseModule {}

class _$SecureStorageModule extends _i305.SecureStorageModule {}

class _$Module extends _i842.Module {}

class _$ApiClientModule extends _i612.ApiClientModule {}
