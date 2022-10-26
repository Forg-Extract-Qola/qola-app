
import 'package:qola_app/core/providers/preferences_provider.dart';

abstract class SessionLocalDataSource {

  void saveToken(String token);
  String? getToken();
  void saveRestaurant(int restaurant);
  int? getRestaurant();
}

class SessionLocalDataSourceImpl implements SessionLocalDataSource {

  final AppPreferences _appPreferences;

  final String TOKEN = 'TOKEN';
  final String RESTAURANT = 'RESTAURANT';

  SessionLocalDataSourceImpl({
    required AppPreferences appPreferences
  }) :
    _appPreferences = appPreferences;

  @override
  void saveToken(String token) => _appPreferences.setValue(TOKEN, token);

  @override
  String? getToken() => _appPreferences.getValue(TOKEN);

  @override
  void saveRestaurant(int restaurant) => _appPreferences.setIntValue(RESTAURANT, restaurant);

  @override
  int? getRestaurant() => _appPreferences.getIntValue(RESTAURANT);

}