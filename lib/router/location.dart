import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_drive/home/home_page.dart';

// Main Location
class Location extends BeamLocation {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(child: const HomePage(), key: const ValueKey('main')),
    ];
  }

  @override
  List<Pattern> get pathBlueprints => ['/'];
  // router 추가시 변경 작업 해야함
}
