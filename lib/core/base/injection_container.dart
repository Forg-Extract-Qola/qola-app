import 'package:get_it/get_it.dart';
import 'package:qola_app/core/providers/http_provider.dart';
import 'package:qola_app/core/providers/preferences_provider.dart';
import 'package:qola_app/layouts/menu/cubits/menu_bar_cubit.dart';
import 'package:qola_app/modules/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:qola_app/modules/auth/data/data_sources/session_local_data_source.dart';
import 'package:qola_app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:qola_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:qola_app/modules/auth/domain/use_cases/do_admin_login.dart';
import 'package:qola_app/modules/auth/presentation/bloc/admin/admin_login_bloc.dart';
import 'package:qola_app/modules/order/data/data_sources/employee_remote_data_source.dart';
import 'package:qola_app/modules/order/data/resporitories/employee_repository_impl.dart';
import 'package:qola_app/modules/order/domain/repositories/employee_repository.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_employees.dart';
import 'package:qola_app/modules/order/presentation/cubits/employee/employee_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initLayouts();
  await initAuthModule();
  await initOrderModule();
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
  sl.registerFactory(() => MenuBarCubit());
}


Future<void> initAuthModule() async {
  //! Blocs
  sl.registerFactory(() => AdminLoginBloc(doAdminLogin: sl()));

  //! Use Cases
  sl.registerLazySingleton(() => DoAdminLogin(authRepository: sl()));

  //! Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
    authRemoteDataSource: sl(),
    sessionLocalDataSource: sl()
  ));

  //! Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
    httpProvider: sl()
  ));
  sl.registerLazySingleton<SessionLocalDataSource>(() => SessionLocalDataSourceImpl(
    appPreferences: sl()
  ));
}

Future<void> initOrderModule() async {
  //! Cubits
  sl.registerFactory(() => EmployeeCubit(doLoadEmployees: sl()));

  //! Use Cases
  sl.registerLazySingleton(() => DoLoadEmployees(employeeRepository: sl()));

  //! Repositories
  sl.registerLazySingleton<EmployeeRepository>(() => EmployeeRepositoryImpl(
    employeeRemoteDataSource: sl()
  ));

  //! Data Sources
  sl.registerLazySingleton<EmployeeRemoteDataSource>(() => EmployeeRemoteDataSourceImpl(
    httpProvider: sl(),
    sessionLocalDataSource: sl()
  ));
}


Future<void> initBoxRepositories() async {
  //! Repositories
}