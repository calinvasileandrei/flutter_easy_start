// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_easy_start/app/app.dart';
import 'package:flutter_easy_start/app/app_bloc_observer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load();
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(AppInitializer()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
