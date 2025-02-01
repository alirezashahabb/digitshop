import 'package:apple_shop/data/repository/auth_repositroy.dart';
import 'package:apple_shop/data/repository/category_repositroy.dart';
import 'package:apple_shop/utils/auth_manager.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                AuthRepositroy().login(
                  'alirezash',
                  '12345678',
                );
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                AuthManager.logout();
              },
              child: Text('LogOut'),
            ),
            ElevatedButton(
              onPressed: () async {
                var either = await CategoryRepositroy().getCategory();
                either.fold((l) {
                  print(l);
                }, (r) {
                  for (var element in r) {
                    print(element.title);
                  }
                });
              },
              child: Text('Test'),
            ),
            ValueListenableBuilder(
              valueListenable: AuthManager.authChangeNotifire,
              builder: (context, value, child) {
                if (value == null || value.isEmpty) {
                  return Text('شما هنوز وارد نشده اید');
                } else {
                  return Text('شما  وارد  شده اید');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
