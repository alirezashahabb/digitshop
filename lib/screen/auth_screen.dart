import 'package:apple_shop/bloc/auth/auth_bloc.dart';
import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/screen/home_screen.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/navigator.dart';
import 'package:apple_shop/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FormKey = GlobalKey<FormState>();
  final TextEditingController userName =
      TextEditingController(text: 'alirezash');
  final TextEditingController password =
      TextEditingController(text: '12345678');
  bool isScure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Assets.img.iconApplication.image(
                      width: 120,
                    ),
                    Text('اپل شاپ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppColor.scaffoldColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(18),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColor.scaffoldColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: FormKey,
                    child: Column(
                      spacing: 30,
                      children: [
                        TextFormField(
                          controller: userName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'وارد کردن  نام کاربری الزامی هست!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text('نام کاربری'),
                          ),
                        ),
                        TextFormField(
                          obscureText: isScure,
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'وارد کردن رمز عبور الزامی هست!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isScure = !isScure;
                                });
                              },
                              icon: Icon(
                                isScure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            label: Text('رمز عبور'),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is AutResponseState) {
                                state.response.fold(
                                  (r) {
                                    goScreen(
                                        context: context,
                                        screen: HomeScreen(),
                                        closeScreen: true,
                                        fullScreen: false);
                                    showCustomAlert(context, r);
                                  },
                                  (l) {
                                    showCustomAlert(
                                        context, l, AlertType.error);
                                  },
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is AuthInitSate) {
                                return ElevatedButton(
                                  onPressed: () {
                                    if (FormKey.currentState!.validate()) {
                                      BlocProvider.of<AuthBloc>(context).add(
                                        AuthLoginEvent(
                                            userName: userName.text,
                                            password: password.text),
                                      );
                                    }
                                  },
                                  child: Text(
                                    'ورود به اپل شاپ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColor.scaffoldColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                );
                              } else if (state is AuthLoadingSate) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is AutResponseState) {
                                return SizedBox();
                              }
                              throw Exception('State not support');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
