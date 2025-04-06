import 'package:apple_shop/bloc/auth/auth_bloc.dart';
import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/screen/login_screen.dart';
import 'package:apple_shop/screen/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _usernameTextController =
      TextEditingController(text: 'amirahmadaban31');
  final _passwordTextController = TextEditingController(text: '12345678');
  final _passwordConfirmTextController =
      TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: ViewContainer(
            usernameTextController: _usernameTextController,
            passwordTextController: _passwordTextController,
            passwordConfirmTextController: _passwordConfirmTextController));
  }
}

class ViewContainer extends StatelessWidget {
  const ViewContainer({
    super.key,
    required TextEditingController usernameTextController,
    required TextEditingController passwordTextController,
    required TextEditingController passwordConfirmTextController,
  })  : _usernameTextController = usernameTextController,
        _passwordTextController = passwordTextController,
        _passwordConfirmTextController = passwordConfirmTextController;

  final TextEditingController _usernameTextController;
  final TextEditingController _passwordTextController;
  final TextEditingController _passwordConfirmTextController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Assets.img.register.image(),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'نام کاربری :',
                        style: TextStyle(fontFamily: 'Shabnam', fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.grey[300],
                        child: TextField(
                          controller: _usernameTextController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'رمز عبور:',
                        style: TextStyle(fontFamily: 'Shabnam', fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.grey[300],
                        child: TextField(
                          controller: _passwordTextController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تکرار رمز عبور :',
                        style: TextStyle(fontFamily: 'Shabnam', fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.grey[300],
                        child: TextField(
                          controller: _passwordConfirmTextController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocConsumer<AuthBloc, AuthState>(listener: ((context, state) {
                  if (state is AuthResponseState) {
                    state.response.fold((l) {}, (r) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => RootScreen()));
                    });
                  }
                }), builder: ((context, state) {
                  if (state is AuthInitSate) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle:
                            TextStyle(fontFamily: 'Shabnam', fontSize: 20),
                        backgroundColor: Colors.blue[700],
                        minimumSize: Size(200, 48),
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthSignInEvent(
                                  userName: _usernameTextController.text,
                                  password: _passwordTextController.text,
                                  confirmPassword:
                                      _passwordConfirmTextController.text),
                            );
                      },
                      child: Text('ثبت نام'),
                    );
                  }

                  if (state is AuthLoadingSate) {
                    return CircularProgressIndicator();
                  }

                  if (state is AuthResponseState) {
                    Text widget = Text('');
                    state.response.fold((l) {
                      widget = Text(l);
                    }, (r) {
                      widget = Text(r);
                    });
                    return widget;
                  }

                  return Text('خطای نا مشخص !');
                })),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: Text(
                      'اگر حساب کاربری دارید وارد شوید',
                      style: TextStyle(fontFamily: 'Shabnam', fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
