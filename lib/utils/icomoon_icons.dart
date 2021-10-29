// Place fonts/icomoon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: icomoon
//      fonts:
//       - asset: fonts/icomoon.ttf
import 'package:flutter/widgets.dart';

class Icomoon {
  Icomoon._();

  static const String _fontFamily = 'icomoon';

  static const IconData Search = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData Map = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData Pointeur = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData Profil = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData Listing = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData Trip = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData Home = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData Inspi = IconData(0xe906, fontFamily: _fontFamily);
}
