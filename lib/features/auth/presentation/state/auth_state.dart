import 'package:vendor_vault/features/auth/domain/entity/auth_entity.dart';

class AuthState {
  final bool isLoading;
  final String? error;


  AuthState({
    required this.isLoading,
    this.error,


  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    AuthEntity? authEntity,
    String? error,


  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,

    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}
