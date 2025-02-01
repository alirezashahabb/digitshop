import 'package:apple_shop/bloc/auth/auth_bloc.dart';
import 'package:apple_shop/screen/test_screen.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  //SharePrefance
  WidgetsFlutterBinding.ensureInitialized();
  // init get it
  await getItInit();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // Farsi
      ],
      debugShowCheckedModeBanner: false,
      title: 'AppleShop',
      theme: lightThemeData(),
      home: const TestScreen(),
    );
  }
}
