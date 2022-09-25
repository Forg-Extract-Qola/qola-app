import 'package:get_it/get_it.dart';
import 'package:qola_app/core/providers/http_provider.dart';
import 'package:qola_app/core/providers/preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initLayouts();
  await initAuthModule();
  await initAdminModule();
  await initEmployeeModule();
  await initBoxRepositories();

  //! Core
  sl.registerLazySingleton(() => HttpProvider());
  sl.registerLazySingleton(() => AppPreferences());

  //! External
  //final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() async => await SharedPreferences.getInstance());

  //! BoxRepository
  await initBoxRepositories();

  //! Extra
  await (AppPreferences()).initPrefs();
}

Future<void> initLayouts() async {
  //! Cubits
}


Future<void> initAuthModule() async {
  //! Cubits

  //! Use Cases

  //! Repositories

  //! Data Sources
}

Future<void> initAdminModule() async {
  //! Cubits

  //! Use Cases

  //! Repositories

  //! Data Sources
}

Future<void> initEmployeeModule() async {
  //! Cubits

  //! Use Cases

  //! Repositories

  //! Data Sources
}

Future<void> initBoxRepositories() async {
  //! Repositories
}