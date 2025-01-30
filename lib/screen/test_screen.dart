import 'package:apple_shop/data/repository/auth_repositroy.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var either = await AuthRepositroy().login(
                'alirezash',
                '12345678',
              );
              var share = locator.get<SharedPreferences>();
              either.fold((error) {
                print(error);
              }, (message) {
                print(message);
                print(
                  share.getString('token'),
                );
              });
            },
            child: Text('Test')),
      ),
    );
  }
}
