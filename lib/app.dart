import 'package:flutter/material.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';
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
            create: (BuildContext context) => CurrentWeatherBloc(
                  weatherRepository: WeatherRepositoryLocator.weatherRepository,
                  locationRepository:
                      LocationRepositoryLocator.locationRepository,
                  dio: WeatherRepositoryLocator.dio,
                )..add(const WeatherFetched())),
        BlocProvider(
            create: (BuildContext context) => DailyWeatherBloc(
                  weatherRepository: WeatherRepositoryLocator.weatherRepository,
                  locationRepository:
                      LocationRepositoryLocator.locationRepository,
                  dio: WeatherRepositoryLocator.dio,
                )..add(const WeatherFetched())),
      ],
      child: MaterialApp(
        theme: ThemeData(
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
