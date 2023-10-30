part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState extends Equatable {
  final String username;
  final String password;

  const SignInState({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}

class CheckingUserState extends SignInState {
  const CheckingUserState({
    required super.username,
    required super.password,
  });
}

class SignInErrorState extends SignInState {
  final String message;

  const SignInErrorState({
    required super.username,
    required super.password,
    required this.message,
  });
}

class SignInLoading extends SignInState {
  const SignInLoading({
    required super.username,
    required super.password,
  });
}

class SignInSuccess extends SignInState {
  const SignInSuccess({
    required super.username,
    required super.password,
  });
}
