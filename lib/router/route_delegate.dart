import 'package:beamer/beamer.dart';
import 'package:flutter_drive/auth/ui/sign_in_page.dart';
import 'package:flutter_drive/router/location.dart';

final routerDelegate = BeamerDelegate(
  guards: [
    BeamGuard(
      pathBlueprints: ['/'],
      check: (context, location) {
        return false;
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
