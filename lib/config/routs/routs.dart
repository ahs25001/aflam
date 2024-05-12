import 'package:aflame/features/movi_descover/presentation/pages/movie_dicover_screen.dart';
import 'package:aflame/features/movie_details/presentation/pages/movie_details_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_scrreen.dart';

class AppRoutes {
  static const String home = "home";
  static const String movieDetails = "movieDetails";
  static const String movieDiscover = "movieDiscover";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
        case AppRoutes.movieDetails:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => MovieDetailsScreen(),
        );
      case AppRoutes.movieDiscover:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => MovieDiscoverScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => ErrorScreen(),
        );
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Error"),
      ),
    );
  }
}
