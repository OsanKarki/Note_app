import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failures.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.invalidCredentials() = _InvalidCredentials;

  const factory AuthFailure.unexpected() = _Unexpected;

  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
}
