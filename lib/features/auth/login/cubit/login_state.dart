part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel? loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginChangePasswordVisibility extends LoginState {}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}
