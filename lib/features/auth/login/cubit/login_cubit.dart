import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/model/login_model/login_model.dart';
import 'package:shopx/services/remote/dio_helper.dart';
import 'package:shopx/services/remote/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    DioClient.postData(url: EndPoints.login, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  Widget suffix = const Icon(Icons.visibility_outlined);
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword
        ? const Icon(Icons.visibility_outlined)
        : const Icon(Icons.visibility_off_outlined);
    emit(LoginChangePasswordVisibility());
  }
}
