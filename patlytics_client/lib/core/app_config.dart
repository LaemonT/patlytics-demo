class AppConfig {
  static const host = String.fromEnvironment('HOST', defaultValue: 'localhost:5438');
  static const String defaultLocale = 'en';
}
