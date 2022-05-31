import 'package:get/get.dart';

import '../model/themes_model.dart';
import '../utils/themes.dart';

class ThemeController extends GetxController {
  /// Selected index of BottomSheet
  var bottomSheetColorIndex = 0;

  /// Current Theme
  ThemesModel currentTheme() {
    return ThemesModel(
        titleColor: listOfThemes[bottomSheetColorIndex].titleColor,
        subTitlelColor: listOfThemes[bottomSheetColorIndex].subTitlelColor,
        bG: listOfThemes[bottomSheetColorIndex].bG,
        iconColor: listOfThemes[bottomSheetColorIndex].iconColor,
        appBarColor: listOfThemes[bottomSheetColorIndex].appBarColor,
        cardColor: listOfThemes[bottomSheetColorIndex].cardColor);
  }

  /// Function For Changing Selected Border Color
  void changeBottomSheetBorderColor(int index) {
    bottomSheetColorIndex = index;
    update();
  }
}
