import 'package:asiftaj_bloc_clean_code/repository/auth/login_repository.dart';
import 'package:asiftaj_bloc_clean_code/utils/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository = LoginRepository();
  LoginBloc() : super(const LoginState()) {
    on<EmailChangedEvent>(_emailChanged);
    on<PasswordChangedEvent>(_passwordChanged);
    on<LoginSubmittedEvent>(_loginSubmitted);
  }

  void _emailChanged(EmailChangedEvent event, Emitter<LoginState> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _passwordChanged(PasswordChangedEvent event, Emitter<LoginState> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  void _loginSubmitted(
    LoginSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    final data = {"email": state.email, "password": state.password};
    await _loginRepository.login(data).then((val) {
      if(val.error.isNotEmpty){
        emit(
        state.copyWith(
          postApiStatus: PostApiStatus.error,
          message: val.error,
        ),
      );
      } else {
        emit(
        state.copyWith(
          postApiStatus: PostApiStatus.success,
          message: "Login Successful",
        ),
      );
      }
    }).onError((
      error,
      stackTrace,
    ) {
      emit(
        state.copyWith(
          postApiStatus: PostApiStatus.error,
          message: error.toString(),
        ),
      );
    });
  }
}
