// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/app_constants.dart';
import 'package:flutter_easy_start/core/app_theme/app_theme.dart';
import 'package:flutter_easy_start/core/app_theme/cubit/theme_cubit.dart';
import 'package:flutter_easy_start/core/repositories/auth_repository.dart';
import 'package:flutter_easy_start/pages/login/cubit/login_cubit.dart';
import 'package:flutter_easy_start/pages/login/view/login_page.dart';
import 'package:flutter_easy_start/pages/splash_screen/view/splash_screen_page.dart';
import 'package:flutter_easy_start/routing/router.dart' as router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_start/tad_widgets/view/tab_bar/tab_bar_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class AppInitializer extends StatelessWidget {
  final AuthRepository authRepository = AuthRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(authRepository),
        ),
      ],
      child: ScreenUtilInit(
          allowFontScaling: false,
          designSize: Size(1125, 2436),
          builder: () => const App()),
    );
  }
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state.status == LoginStatus.Uninitialized) {
          return const MaterialApp(home: SplashScreenPage());
        } else if (state.status == LoginStatus.Authenticated) {
          return MaterialApp(
            title: appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: context
                .select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
            onGenerateRoute: router.generateRoute,
            navigatorKey: navigatorKey,
            home: TabBarController(),
          );
        } else {
          return MaterialApp(
            title: appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: context
                .select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
            onGenerateRoute: router.generateRoute,
            navigatorKey: navigatorKey,
            home: LoginPage(),
          );
        }
      },
    );
  }
}
