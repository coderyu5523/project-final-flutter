import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/callback_dispatcher.dart';
import 'package:workmanager/workmanager.dart';

import '_core/constants/http.dart';
import '_core/constants/move.dart';
import '_core/constants/theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager().registerPeriodicTask(
      "1",
      fetchBackground,
      frequency: Duration(minutes: 15),);

      dio.interceptors.add(interceptor);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // context가 없는 곳에서 context를 사용할 수 있는 방법
      debugShowCheckedModeBanner: false,
      initialRoute: Move.welcomePage,
      routes: getRouters(),
      theme: theme(),
      // home: const WelcomePage(),  //
    );
  }
}
