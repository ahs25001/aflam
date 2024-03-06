import 'package:aflame/config/routs/routs.dart';
import 'package:aflame/config/thimeing/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import "config.dart";
import 'app_bloc.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: ScreenUtilInit(
        designSize: const Size(412, 892),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return MaterialApp(
              theme: (state.mode == Mode.light) ? MyTheme.light : MyTheme.dark,
              darkTheme: MyTheme.dark,
              debugShowCheckedModeBanner: false,
              initialRoute: "/",
              onGenerateRoute: (settings) => Routes.onGenerate(settings),
            );
          },
        ),
      ),
    );
  }
}
