import 'package:flutter/material.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (context.watch<UserProvider>().authenticationUser != null) {
    //   return const Center(child: CircularProgressIndicator());
    // }
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Padding(
                //   padding: EdgeInsets.only(bottom: 50),
                //   child: Text(
                //     'Drive',
                //     style: TextStyle(fontSize: 30),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialLoginIconForm(
                        onTap: () {
                          context.read<AuthProvider>().signInWithGoogle();
                        },
                        title: 'G',
                        color: Colors.blue),
                  ],
                )
              ],
            ),
          ),
          // if (context.watch<AuthProvider>().isSignIn) ...[
          //   const Center(
          //     child: CircularProgressIndicator(),
          //   )
          // ],
        ],
      ),
    );
  }

  Padding _socialLoginIconForm({
    required Function() onTap,
    required String title,
    required Color color,
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
            child: Center(child: Text(title)),
          ),
        ),
      ),
    );
  }
}
