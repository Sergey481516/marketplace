// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:marketplace/core/secure_storage_module/secure_storage.dart'
    as _i419;
import 'package:marketplace/features/data/data_sources/local/auth_secure_storage.dart'
    as _i254;
import 'package:marketplace/features/data/data_sources/remote/api_client_factory.dart'
    as _i144;
import 'package:marketplace/features/data/data_sources/remote/auth_api_service.dart'
    as _i802;
import 'package:marketplace/features/data/repository/auth.dart' as _i1004;
import 'package:marketplace/features/domain/repository/auth_repository.dart'
    as _i451;
import 'package:marketplace/features/domain/usecases/auth/forgot_password.dart'
    as _i734;
import 'package:marketplace/features/domain/usecases/auth/login.dart' as _i536;
import 'package:marketplace/features/domain/usecases/auth/logout.dart' as _i285;
import 'package:marketplace/features/domain/usecases/auth/refresh_token.dart'
    as _i1051;
import 'package:marketplace/features/domain/usecases/auth/register.dart'
    as _i869;
import 'package:marketplace/features/domain/usecases/auth/resend_code.dart'
    as _i658;
import 'package:marketplace/features/domain/usecases/auth/reset_password.dart'
    as _i181;
import 'package:marketplace/features/domain/usecases/auth/verify_code.dart'
    as _i745;
import 'package:marketplace/features/presentation/bloc/remote/auth/bloc.dart'
    as _i1050;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final secureStorageModule = _$SecureStorageModule();
    final apiClientFactory = _$ApiClientFactory();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.secureStorage,
    );
    gh.lazySingleton<_i361.Dio>(
      () => apiClientFactory.authApiClient(),
      instanceName: 'authApiClient',
    );
    gh.lazySingleton<_i802.AuthApiService>(
      () => _i802.AuthApiService(gh<_i361.Dio>(instanceName: 'authApiClient')),
    );
    gh.lazySingleton<_i254.AuthSecureStorage>(
      () => _i254.AuthSecureStorage(
        secureStorage: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i451.AuthRepository>(
      () => _i1004.AuthRepositoryImpl(
        gh<_i802.AuthApiService>(),
        gh<_i254.AuthSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i745.VerifyCodeUseCase>(
      () => _i745.VerifyCodeUseCase(authRepository: gh<_i451.AuthRepository>()),
    );
    gh.lazySingleton<_i734.ForgotPasswordUseCase>(
      () => _i734.ForgotPasswordUseCase(
        authRepository: gh<_i451.AuthRepository>(),
      ),
    );
    gh.lazySingleton<_i536.LoginUseCase>(
      () => _i536.LoginUseCase(authRepository: gh<_i451.AuthRepository>()),
    );
    gh.lazySingleton<_i869.RegisterUseCase>(
      () => _i869.RegisterUseCase(authRepository: gh<_i451.AuthRepository>()),
    );
    gh.lazySingleton<_i181.ResetPasswordUseCase>(
      () => _i181.ResetPasswordUseCase(
        authRepository: gh<_i451.AuthRepository>(),
      ),
    );
    gh.lazySingleton<_i658.ResendCodeUseCase>(
      () => _i658.ResendCodeUseCase(authRepository: gh<_i451.AuthRepository>()),
    );
    gh.lazySingleton<_i285.LogoutUseCase>(
      () => _i285.LogoutUseCase(authRepository: gh<_i451.AuthRepository>()),
    );
    gh.lazySingleton<_i1051.RefreshTokenUseCase>(
      () => _i1051.RefreshTokenUseCase(
        authRepository: gh<_i451.AuthRepository>(),
      ),
    );
    gh.factory<_i1050.RemoteAuthBloc>(
      () => _i1050.RemoteAuthBloc(
        gh<_i869.RegisterUseCase>(),
        gh<_i536.LoginUseCase>(),
        gh<_i734.ForgotPasswordUseCase>(),
        gh<_i658.ResendCodeUseCase>(),
        gh<_i745.VerifyCodeUseCase>(),
        gh<_i181.ResetPasswordUseCase>(),
        gh<_i1051.RefreshTokenUseCase>(),
        gh<_i285.LogoutUseCase>(),
      ),
    );
    return this;
  }
}

class _$SecureStorageModule extends _i419.SecureStorageModule {}

class _$ApiClientFactory extends _i144.ApiClientFactory {}
