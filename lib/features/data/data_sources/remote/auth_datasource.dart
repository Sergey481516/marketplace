import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:marketplace/core/error/exception.dart';

import 'package:marketplace/features/data/models/auth/auth_model.dart';

abstract class AuthRemoteDatasource {
  Future<AuthModel> registerByPassword(RegisterRequest req);
  Future<AuthModel> loginByPassword(LoginRequest req);
  Future<void> logout();
  Future<void> sendPasswordResetEmail(ForgotPasswordRequest req);
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  AuthRemoteDatasourceImpl();

  @override
  Future<AuthModel> registerByPassword(RegisterRequest req) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: req.email,
            password: req.password,
          );

      await credential.user?.updateDisplayName(req.fullName);
      await credential.user?.reload();

      return AuthModel.fromFirebaseCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseException(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> loginByPassword(LoginRequest req) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: req.email,
        password: req.password,
      );

      return AuthModel.fromFirebaseCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e);
      throw AuthException.fromFirebaseException(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> sendPasswordResetEmail(ForgotPasswordRequest req) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: req.email,
      actionCodeSettings: ActionCodeSettings(
        url: 'https://marketplace-c2497.web.app',
        handleCodeInApp: true,
        androidPackageName: 'com.example.marketplace',
        iOSBundleId: 'com.example.marketplace',
      ),
    );
  }
}
