
import 'package:qola_app/core/providers/preferences_provider.dart';

abstract class SessionLocalDataSource {

  void saveToken(String token);
  String? getToken();
}

class SessionLocalDataSourceImpl implements SessionLocalDataSource {

  final AppPreferences _appPreferences;

  final String TOKEN = 'TOKEN';

  SessionLocalDataSourceImpl({
    required AppPreferences appPreferences
  }) :
    _appPreferences = appPreferences;

  @override
  void saveToken(String token) => _appPreferences.setValue(TOKEN, token);

  @override
  String? getToken() => _appPreferences.getValue(TOKEN);
}