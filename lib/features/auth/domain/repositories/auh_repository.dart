import 'package:dartz/dartz.dart';
import 'package:iss_task_app/core/error/failure.dart';
import 'package:iss_task_app/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  // Future<Either<AppFailure, AppUser>> signUp({
  //   required SignUpRequestBody signUpRequestBody,
  // });
  Future<Either<AppFailure, AppUser>> loginWithEmail({
    required String email,
    required String password,
  });
}
