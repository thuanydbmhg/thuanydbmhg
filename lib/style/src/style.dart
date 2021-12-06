part of style;

class Style {
  static void styleDefault() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: mColorNavigationBar,
        systemNavigationBarIconBrightness: Brightness.light));
  }
}
