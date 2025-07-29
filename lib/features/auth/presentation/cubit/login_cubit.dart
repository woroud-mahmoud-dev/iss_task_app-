import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iss_task_app/core/error/failure.dart';
import 'package:iss_task_app/features/auth/domain/entities/app_user.dart';
import 'package:iss_task_app/features/auth/domain/useCases/login_with_email.dart';

import 'login_state.dart';

class LogInCubit extends Cubit<LoginState> {
  LogInWithEmailUseCase logInWithEmailUseCase;

  LogInCubit(this.logInWithEmailUseCase) : super(LoginInitial());

  Future<void> logInWithEmail(String email, String password) async {
    emit(LoginLoading());

    final result = await logInWithEmailUseCase(
      email: email,
      password: password,
    );
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    result.fold(
      (AppFailure failure) => emit(LoginError(failure.message.toString())),
      (AppUser user) => emit(LoginSuccess()),
    );
  }
}
