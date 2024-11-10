import 'package:patlytics_client/app/di/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService {
  AppService() {
    init();
  }

  void init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    AppInjector.instance.signalReady(this);
  }

  late SharedPreferences _sharedPreferences;

  String? get sessionId => _sharedPreferences.getString('sessionKey');

  void setSessionId(String value) => _sharedPreferences.setString('sessionKey', value);
}
