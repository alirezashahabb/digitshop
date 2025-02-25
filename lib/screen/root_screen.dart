import 'dart:ui';

import 'package:apple_shop/bloc/cart/cart_bloc.dart';
import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/screen/cart%20_screen.dart';
import 'package:apple_shop/screen/category_screen.dart';
import 'package:apple_shop/screen/home_screen.dart';
import 'package:apple_shop/screen/profile_scren.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selctedIndex = 0;
  final GlobalKey<NavigatorState> homeKey = GlobalKey();
  final GlobalKey<NavigatorState> categoryKey = GlobalKey();
  final GlobalKey<NavigatorState> basketKey = GlobalKey();
  final GlobalKey<NavigatorState> profileKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          child: BottomNavigationBar(
            currentIndex: _selctedIndex,
            onTap: (value) {
              setState(() {
                _selctedIndex = value;
              });
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedLabelStyle:
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 10,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
            unselectedLabelStyle:
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 10,
                      color: AppColor.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Assets.img.iconHome.image(),
                activeIcon: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: AppColor.mainColor,
                        offset: Offset(0, 13),
                        blurRadius: 20,
                        spreadRadius: -7,
                      )
                    ]),
                    child: Assets.img.iconHomeActive.image()),
                label: 'خانه',
              ),
              BottomNavigationBarItem(
                icon: Assets.img.iconCategory.image(),
                activeIcon: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: AppColor.mainColor,
                        offset: Offset(0, 13),
                        blurRadius: 20,
                        spreadRadius: -7,
                      )
                    ]),
                    child: Assets.img.iconCategoryActive.image()),
                label: 'دسته بندی',
              ),
              BottomNavigationBarItem(
                icon: Assets.img.iconBasket.image(),
                activeIcon: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: AppColor.mainColor,
                        offset: Offset(0, 13),
                        blurRadius: 20,
                        spreadRadius: -7,
                      )
                    ]),
                    child: Assets.img.iconBasketActive.image()),
                label: 'سبد خرید',
              ),
              BottomNavigationBarItem(
                icon: Assets.img.iconProfile.image(),
                activeIcon: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: AppColor.mainColor,
                        offset: Offset(0, 13),
                        blurRadius: 20,
                        spreadRadius: -7,
                      )
                    ]),
                    child: Assets.img.iconProfileActive.image()),
                label: 'پروفایل',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selctedIndex,
        children: [
          Navigator(
            key: homeKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => HomeScreen(),
              settings: settings,
            ),
          ),
          Navigator(
            key: categoryKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => CategoryScreen(),
              settings: settings,
            ),
          ),
          Navigator(
            key: basketKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) {
                  var bloc = locator.get<CartBloc>();
                  bloc.add(CartInitEvent());
                  return bloc;
                },
                child: CartScreen(),
              ),
              settings: settings,
            ),
          ),
          Navigator(
            key: profileKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => ProfileScreen(),
              settings: settings,
            ),
          ),
        ],
      ),
    );
  }
}
