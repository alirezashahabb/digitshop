import 'package:apple_shop/data/datasource/auth_datasource.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              var auth = AuthremoteDataSource();
              auth.register('alirezarfmk', '1234567890', '1234567890');
            },
            child: Text('Test')),
      ),
    );
  }
}
