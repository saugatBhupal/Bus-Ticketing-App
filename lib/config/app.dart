import 'package:bus_ticketing_app/config/app_routes/app_router.dart';
import 'package:bus_ticketing_app/config/app_routes/app_routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.booking,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
