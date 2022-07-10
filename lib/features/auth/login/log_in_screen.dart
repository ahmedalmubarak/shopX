import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/animation/animated_icon.dart';
import 'package:shopx/config/routes.dart';
import 'package:shopx/constants/scales.dart';
import 'package:shopx/features/auth/login/cubit/login_cubit.dart';
import 'package:shopx/services/local/cache_helper.dart';
import 'package:shopx/widgets/social_account.dart';
import 'package:shopx/widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isEMailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel!.status!) {
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel!.data!.token,
            ).then((value) => Navigator.pushReplacementNamed(
                context, AppRoutes.homePageRoute));
          } else {
            print(state.loginModel!.message);
          }
        }
      },
      builder: (context, state) {
        final loginCubit = LoginCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.09),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 64),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            controller: _emailController,
                            hint: 'Email',
                            label: 'Email',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'email enter a value';
                              } else if (!isEMailValid(value)) {
                                return 'Please enter a valid email address.';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFieldWidget(
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter a password.';
                              } else {
                                return null;
                              }
                            },
                            hint: 'Password',
                            label: 'Password',
                            isPassword: loginCubit.isPassword,
                            suffixIcon: GestureDetector(
                              child: loginCubit.suffix,
                              onTap: loginCubit.changePasswordVisibility,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    state is! LoginLoadingState
                        ? SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  loginCubit.userLogin(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                                }
                              },
                              child: const Text('LOGIN'),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.red)),
                          ),
                    const SizedBox(height: 100),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
