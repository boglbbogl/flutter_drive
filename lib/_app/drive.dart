import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_theme.dart';
import 'package:flutter_drive/address/provider/address_provider.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/create/provider/course_provider.dart';
import 'package:flutter_drive/feed/feed_provider.dart';
import 'package:flutter_drive/router/route_delegate.dart';
import 'package:provider/provider.dart';

class Drive extends StatelessWidget {
  const Drive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => FeedProvider()),
      ],
      child: MaterialApp.router(
        routeInformationParser: BeamerParser(),
        routerDelegate: routerDelegate,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
