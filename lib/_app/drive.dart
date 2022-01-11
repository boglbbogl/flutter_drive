import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_theme.dart';
import 'package:flutter_drive/address/provider/address_provider.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/blocked/provider/blocked_provider.dart';
import 'package:flutter_drive/content/provider/content_provider.dart';
import 'package:flutter_drive/course/provider/course_provider.dart';
import 'package:flutter_drive/feed/provider/feed_main_provider.dart';
import 'package:flutter_drive/feed/provider/feed_user_provider.dart';
import 'package:flutter_drive/notification/provider/notification_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/recommendation/recommendation_provider.dart';
import 'package:flutter_drive/router/route_delegate.dart';
import 'package:flutter_drive/setting/provider/setting_provider.dart';
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
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => FeedMainProvider()),
        ChangeNotifierProvider(create: (context) => FeedUserProvider()),
        ChangeNotifierProvider(create: (context) => ContentProvider()),
        ChangeNotifierProvider(create: (context) => BlockedProvider()),
        ChangeNotifierProvider(create: (context) => SettingProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => RecommendationProvider()),
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
