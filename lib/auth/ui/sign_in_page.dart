import 'package:flutter/material.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<AuthProvider>().isLoginState &&
        context.watch<AuthProvider>().user != null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Drive',
              style: TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialLoginIconForm(
                    isSignIn: context.watch<AuthProvider>().isGoogle,
                    onTap: () {
                      context.read<AuthProvider>().signInWithGoogle();
                    },
                    title: 'G',
                    color: Colors.red),
                _socialLoginIconForm(
                    isSignIn: context.watch<AuthProvider>().isKakao,
                    onTap: () {
                      context.read<AuthProvider>().signInWithKakao();
                    },
                    title: 'K',
                    color: Colors.amber),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding _socialLoginIconForm({
    required Function() onTap,
    required String title,
    required Color color,
    required bool isSignIn,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 60,
            height: 60,
            color: color,
            child: Center(
                child:
                    isSignIn ? const CircularProgressIndicator() : Text(title)),
          ),
        ),
      ),
    );
  }
}
