import 'package:apple_shop/bloc/auth/auth_bloc.dart';
import 'package:apple_shop/bloc/cart/cart_bloc.dart';
import 'package:apple_shop/bloc/category/category_bloc.dart';
import 'package:apple_shop/bloc/comment/comment_bloc.dart';
import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/bloc/prodoct/prodoct_list_bloc.dart';
import 'package:apple_shop/bloc/productSingle/productsingle_bloc.dart';
import 'package:apple_shop/model/cart_item_model.dart';
import 'package:apple_shop/screen/login_screen.dart';
import 'package:apple_shop/screen/root_screen.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/auth_manager.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //SharePrefance
  WidgetsFlutterBinding.ensureInitialized();
  // init get it

  // init Hive
  await Hive.initFlutter();
  Hive.registerAdapter(
    CartItemModelAdapter(),
  );
  await Hive.openBox<CartItemModel>('cartItem');

  await getItInit();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsingleBloc(),
        ),
        BlocProvider(
          create: (context) => ProdoctListBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(locator.get(), locator.get()),
        ),
        BlocProvider(
          create: (context) => CommentBloc(
            locator.get(),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
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
      home: AuthManager.isLogedin() ? RootScreen() : LoginScreen(),
    );
  }
}
