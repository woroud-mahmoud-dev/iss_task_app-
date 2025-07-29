import 'package:dartz/dartz.dart';
import 'package:iss_task_app/core/error/failure.dart';
import 'package:iss_task_app/features/auth/domain/entities/app_user.dart';
import 'package:iss_task_app/features/auth/domain/repositories/auh_repository.dart';

class LogInWithEmailUseCase {
  final AuthRepository repository;

  LogInWithEmailUseCase(this.repository);

  Future<Either<AppFailure, AppUser>> call({
    required String email,
    required String password,
  }) async {
    return await repository.loginWithEmail(email: email, password: password);
  }
}
