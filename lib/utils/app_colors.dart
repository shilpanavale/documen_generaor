

import 'dart:ui';

class ColorsForApp{
  static Color blackColor=ColorConverter.hexToColor("#1D1617");
  static Color grayLight=ColorConverter.hexToColor("#ADA4A5");
}
class ColorConverter{
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

}