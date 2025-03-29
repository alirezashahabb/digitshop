import 'package:apple_shop/screen/auth_screen.dart';
import 'package:apple_shop/utils/auth_manager.dart';
import 'package:apple_shop/utils/navigator.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              AuthManager.logout();
              goScreen(
                  context: context,
                  screen: AuthScreen(),
                  closeScreen: true,
                  fullScreen: false);
            },
            child: Text('logOut'),
          ),
        ],
      ),
    ));
  }
}
