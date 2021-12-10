import 'package:beamer/beamer.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/ui/sign_in_page.dart';
import 'package:flutter_drive/router/location.dart';
import 'package:provider/provider.dart';

final routerDelegate = BeamerDelegate(
  guards: [
    BeamGuard(
      pathBlueprints: ['/'],
      check: (context, location) {
        return context.watch<AuthProvider>().userStatus;

        // false -> SignIn, true -> Main
      },
      showPage: BeamPage(child: const SignInPage()),
    ),
  ],
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      Location(),
    ],
  ),
);
