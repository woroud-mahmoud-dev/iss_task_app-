import 'package:dartz/dartz.dart';
import 'package:iss_task_app/core/error/failure.dart';
import 'package:iss_task_app/features/auth/data/datasources/local_auth_data_source.dart';
import 'package:iss_task_app/features/auth/domain/entities/app_user.dart';
import 'package:iss_task_app/features/auth/domain/repositories/auh_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalAuthDataSource _localDataSource;

  AuthRepositoryImpl({required LocalAuthDataSource localDataSource})
    : _localDataSource = localDataSource;

  @override
  Future<Either<AppFailure, AppUser>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final isValid = await _localDataSource.validateUser(email, password);
      if (isValid) {
        final user = await _localDataSource.getUser();
        if (user != null) {
          return Right(user);
        } else {
          return Left(ValidationFailure('$email not found'));
        }
      } else {
        return const Left(AuthenticationFailure(message: 'Invalid credentials'));
      }
    } catch (e) {
      return const Left(LocalStorageFailure());
    }
  }
}
