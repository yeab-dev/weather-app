import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather/weather/view/daily_forecast/widgets/widgets.dart';

class DailyForeCastPage extends StatelessWidget {
  const DailyForeCastPage._();

  static Route<void> route(WeatherBloc dailyWeatherBloc) {
    return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
              value: dailyWeatherBloc,
              child: const DailyForeCastPage._(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        List<int> maxTemperaturesOfTheWeek = (state as WeatherFetchSuccess)
            .dailyWeather
            .maxTemperature
            .map((temperature) => temperature.round())
            .toList();
        List<int> minTemperaturesOfTheWeek = state.dailyWeather.minTemperature
            .map((temperature) => temperature.round())
            .toList();
        List<double> windSpeedValuesOfTheWeek = [10, 20, 30, 40, 50, 60];

        List<double> humidityValuesOfTheWeek = [10, 20, 30, 40, 50, 60];
        List<double> cloudCoverValuesOfTheWeek = [10, 20, 30, 40, 50, 60];
        return Scaffold(
            body: Column(
          children: [
            MoreInfoCardForDailyWeather(
              maxTemperaturesOfTheWeek: maxTemperaturesOfTheWeek,
              minTemperaturesOfTheWeek: minTemperaturesOfTheWeek,
              windSpeedsOfTheWeek: windSpeedValuesOfTheWeek,
              humidityValuesOfTheWeek: humidityValuesOfTheWeek,
              cloudCoverValuesOfTheWeek: cloudCoverValuesOfTheWeek,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.07,
            ),
            const DailyWeatherInfoCard(
                day: "Mon", weatherType: "Sunny", maxAndMinTemp: "10 / 5")
          ],
        ));
      },
    );
  }
}
