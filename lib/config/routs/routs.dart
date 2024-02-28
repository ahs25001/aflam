import 'package:aflame/features/movie_details/presentation/pages/movie_details_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_scrreen.dart';

class AppRoutes {
  static const String home = "/";
  static const String movieDetails = "movieDetails";
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
