import 'dart:developer';

import 'package:bloc/bloc.dart';

class WeatherObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("Error: $error\nStack trace: $stackTrace");
    super.onError(bloc, error, stackTrace);
  }
}
