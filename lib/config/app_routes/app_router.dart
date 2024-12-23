import 'package:bus_ticketing_app/config/app_routes/app_routes.dart';
import 'package:bus_ticketing_app/model/ticket.dart';
import 'package:bus_ticketing_app/views/BillingScreen.dart';
import 'package:bus_ticketing_app/views/BookingScreen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(builder: (context) => const Bookingscreen());
      case AppRoutes.booking:
        return MaterialPageRoute(builder: (context) => const Bookingscreen());
      case AppRoutes.billing:
        return MaterialPageRoute(builder: (context) =>  Billingscreen(ticket: settings.arguments as Ticket,));
      default:
        return MaterialPageRoute(builder: (context) => const Bookingscreen());
    }
  }
}
