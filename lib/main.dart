import 'package:apple_shop/bloc/auth/auth_bloc.dart';
import 'package:apple_shop/bloc/bloc/prodoct_list_bloc.dart';
import 'package:apple_shop/bloc/category/category_bloc.dart';
import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/bloc/productSingle/productsingle_bloc.dart';
import 'package:apple_shop/model/cart_item_model.dart';
import 'package:apple_shop/screen/cart%20_screen.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //SharePrefance
  WidgetsFlutterBinding.ensureInitialized();
  // init get it
  await getItInit();
  // init Hive
  await Hive.initFlutter();
  Hive.registerAdapter(
    CartItemModelAdapter(),
  );
  await Hive.openBox<CartItemModel>('cartItem');

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
      home: CartScreen(),
    );
  }
}
