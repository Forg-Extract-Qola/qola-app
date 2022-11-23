import 'dart:io';

import 'package:qola_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qola_app/theme/theme.dart';
import 'package:qola_app/main.reflectable.dart';
import 'package:qola_app/core/data/database.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/core/base/injection_container.dart' as di;
import 'package:qola_app/modules/auth/domain/repositories/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeReflectable();

  await di.init();
  await Database.db.initDB();

  HttpOverrides.global = MentalHttpOverrides();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final initialRoute = sl<AuthRepository>().getInitialPage();

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {

  final String initialRoute;

  const MyApp({
    Key? key,
    required this.initialRoute
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qola',
      theme: theme(context),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: initialRoute
    );
  }
}

class MentalHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..maxConnectionsPerHost=30
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}