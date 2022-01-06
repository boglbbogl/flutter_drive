import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (context.watch<AuthProvider>().isLoginState) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: SizedBox(
        height: _size.height,
        width: _size.width,
        child: Stack(
          children: [
            SizedBox(
              width: _size.width,
              height: _size.height,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/background_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: _size.width,
              height: _size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: _size.height * 0.2),
                      Shimmer.fromColors(
                        baseColor: const Color.fromRGBO(195, 195, 195, 1),
                        highlightColor: const Color.fromRGBO(235, 235, 235, 1),
                        child: Text(
                          'ROUTE 66',
                          style: TextStyle(
                              fontFamily: 'Monoton',
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: appMainColor),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialLoginButton(
                              isLogin: context.watch<AuthProvider>().isGoogle,
                              onTap: () {
                                context
                                    .read<AuthProvider>()
                                    .signInWithGoogle(context: context);
                              },
                              assets: 'assets/images/google.png'),
                          SizedBox(width: _size.width * 0.15),
                          _socialLoginButton(
                              isLogin: context.watch<AuthProvider>().isKakao,
                              onTap: () {
                                context
                                    .read<AuthProvider>()
                                    .signInWithKakao(context: context);
                              },
                              assets: 'assets/images/kakao-talk.png'),
                        ],
                      ),
                      SizedBox(height: _size.height * 0.15)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _socialLoginButton({
    required Function() onTap,
    required String assets,
    required bool isLogin,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: isLogin
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : Image.asset(assets),
        ),
      ),
    );
  }
}
