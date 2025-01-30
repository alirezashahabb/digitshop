import 'package:apple_shop/data/repository/auth_repositroy.dart';
import 'package:flutter/material.dart';

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
              either.fold((error) {
                print(error);
              }, (message) {
                print(message);
              });
            },
            child: Text('Test')),
      ),
    );
  }
}
