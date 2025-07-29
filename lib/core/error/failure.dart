import 'package:flutter/foundation.dart';

@immutable
abstract class AppFailure {
  final String message;
  const AppFailure({required this.message});

  @override
  String toString() => '$runtimeType: $message';
}

class NetworkFailure extends AppFailure {
  const NetworkFailure()
    : super(
        message:
            "Failed to connect to the internet. Please check your network.",
      );
}

class ServerFailure extends AppFailure {
  const ServerFailure()
    : super(message: "A server error occurred. Please try again later.");
}

class ValidationFailure extends AppFailure {
  const ValidationFailure(String message) : super(message: message);
}

class AIModelFailure extends AppFailure {
  const AIModelFailure()
    : super(message: "AI request could not be processed at the moment.");
}

class ParsingFailure extends AppFailure {
  const ParsingFailure() : super(message: "Error parsing data.");
}

class LocalStorageFailure extends AppFailure {
  const LocalStorageFailure()
    : super(message: "An error occurred while saving data locally.");
}

class PermissionFailure extends AppFailure {
  const PermissionFailure()
    : super(message: "Required permissions were not granted.");
}

class UnknownFailure extends AppFailure {
  const UnknownFailure()
    : super(message: "An unexpected error occurred. Please try again later.");
}

class AuthenticationFailure extends AppFailure {
  const AuthenticationFailure({required super.message});
}
