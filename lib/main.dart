import 'package:aflame/config/routs/routs.dart';
import 'package:aflame/config/thimeing/my_theme.dart';
import 'package:aflame/core/utils/app_images.dart';
import 'package:aflame/features/home/presentation/pages/home_scrreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_bloc.dart';
import "config.dart";
import 'core/shared_preferences/shared_preferences.dart';
import 'my_opserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.init();
  String? theme = await SharedPreferencesManager.getStringData("theme");
  configureDependencies();
  await ScreenUtil.ensureScreenSize();
  // Bloc.observer = MyBlocObserver();
  runApp(MyApp(theme ?? "dark"));
}

class MyApp extends StatelessWidget {
  String theme;

  MyApp(this.theme);

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
            ThemeData currentTheme = (state.mode != Mode.init)
                ? ((state.mode == Mode.light) ? MyTheme.light : MyTheme.dark)
                : (theme == "light")
                    ? MyTheme.light
                    : MyTheme.dark;
            if (state.mode == Mode.init) {
              AppBloc.get(context).add(SaveModeEvent(theme));
            }
            return MaterialApp(
              theme: currentTheme,
              debugShowCheckedModeBanner: false,
              // initialRoute: "/",
              home: AnimatedSplashScreen(
                backgroundColor: Colors.black,
                splashIconSize: 200.sp,
                splashTransition: SplashTransition.fadeTransition,
                duration: 1000,
                animationDuration: const Duration(seconds: 3),
                curve: Curves.bounceInOut,
                splash: Image.asset(AppImages.splashImage,
                    width: 168.w, height: 187.h),
                nextScreen: HomeScreen(),
              ),
              onGenerateRoute: (settings) => Routes.onGenerate(settings),
            );
          },
        ),
      ),
    );
  }
}
