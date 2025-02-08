import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLastVisitedPage(String pageName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('lastVisitedPage', pageName);
}
