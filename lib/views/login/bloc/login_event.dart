part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class EmailChangedEvent extends LoginEvent {
  final String email;
  const EmailChangedEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class EmailUnfocusedEvent extends LoginEvent {
  const EmailUnfocusedEvent();

  @override
  List<Object?> get props => [];
}

class PasswordChangedEvent extends LoginEvent {
  final String password;
  const PasswordChangedEvent(this.password);

  @override
  List<Object?> get props => [password];
}

class PasswordUnfocusedEvent extends LoginEvent {
  const PasswordUnfocusedEvent();

  @override
  List<Object?> get props => [];
}

class LoginSubmittedEvent extends LoginEvent {
  const LoginSubmittedEvent();

  @override
  List<Object?> get props => [];
}
