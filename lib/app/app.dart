// Copyright (c) 2021, Calin Vasile Andrei
// https://calinandrei.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/app_constants.dart';
import 'package:flutter_easy_start/core/app_theme/app_theme.dart';
import 'package:flutter_easy_start/core/app_theme/cubit/theme_cubit.dart';
import 'package:flutter_easy_start/pages/login/cubit/login_cubit.dart';
import 'package:flutter_easy_start/pages/login/view/login_page.dart';
import 'package:flutter_easy_start/pages/splash_screen/view/splash_screen_page.dart';
import 'package:flutter_easy_start/routing/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_start/tad_widgets/view/tab_bar/tab_bar_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class AppInitializer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: Size(375, 812),
          builder: () => const App()),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  bool activeSplashScreen= true;

  ///Start 2 seconds await for the splashscreen
  initSplashScreen() async{
    await Future.delayed(const Duration(seconds: 2), (){
      setState(() {
        activeSplashScreen = false;
      });
    });
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
    initSplashScreen();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return MaterialApp(
          title: AppConstants.appName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
          onGenerateRoute: AppRouter.generateRoute,
          navigatorKey: navigatorKey,
          home: _selectWidgetState(state),
        );
      },
    );
  }

  Widget _selectWidgetState(LoginState state){
    if (state.status == LoginStatus.Uninitialized || activeSplashScreen) {
      //On init
      return SplashScreenPage();
    } else if (state.status == LoginStatus.Authenticated) {
      //If the user successfully authenticated
      return TabBarController();
    } else {
      //If the user has to login
      return LoginPage();
    }
  }

}

