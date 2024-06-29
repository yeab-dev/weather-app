import 'package:flutter/material.dart';
import 'package:weather/weather/bloc/location_bloc/location_bloc.dart';
import 'package:weather/weather/bloc/weather_bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/repositories/services/services.dart';
import 'package:weather/weather/view/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => WeatherBloc(
                  weatherRepository: WeatherRepositoryLocator.weatherRepository,
                  locationRepository:
                      LocationRepositoryLocator.locationRepository,
                  dio: WeatherRepositoryLocator.dio,
                )),
        BlocProvider<LocationBloc>(
            create: (BuildContext context) =>
                LocationBloc()..add(const LocationRetrivalRequested()))
      ],
      child: MaterialApp(
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return const Color(0xFF90F8FF);
                }
                return const Color(0xFF00274A);
              }),
              foregroundColor:
                  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return const Color(0xFF00274A);
                }
                return const Color(0xFF90F8FF);
              }),
            )),
            scaffoldBackgroundColor: const Color(0xFF90F8FF),
            colorScheme: ColorScheme.fromSeed(
                surface: const Color(0xFF90F8FF),
                seedColor: const Color(0xFF00274A),
                primary: const Color(0xFF00274A))),
        home: const HomePage(),
      ),
    );
  }
}
