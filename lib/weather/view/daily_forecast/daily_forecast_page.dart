import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather/weather/repositories/_repositories.dart';
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
        List<double> maxTemperaturesOfTheWeek =
            (state as WeatherFetchSuccess).dailyWeather.maxTemperature;
        List<WeatherType> weatherTypes = state.dailyWeather.weatherType;
        List<int> minTemperaturesOfTheWeek = state.dailyWeather.minTemperature
            .map((temperature) => temperature.round())
            .toList();
        List<double> windSpeedValuesOfTheWeek = state.dailyWeather.windSpeed;
        List<DateTime> days = state.dailyWeather.days;

        final List<double> rainSumValuesOfTheWeek = state.dailyWeather.rainSum;
        List<double> showerSumValuesOfTheWeek = state.dailyWeather.showersSum;
        return Scaffold(
            body: Column(
          children: [
            MoreInfoCardForDailyWeather(
              weatherType: weatherTypes[1],
              maxTemperature: maxTemperaturesOfTheWeek[1],
              minTemperature: minTemperaturesOfTheWeek[1],
              windSpeedsOfTheWeek: windSpeedValuesOfTheWeek[1],
              rainSum: rainSumValuesOfTheWeek[1],
              showerSum: showerSumValuesOfTheWeek[1],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.62,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      DailyWeatherInfoCard(
                          day: days[index + 2],
                          weatherType: weatherTypes[index + 2],
                          maxTemp: maxTemperaturesOfTheWeek[index + 2],
                          minTemp: minTemperaturesOfTheWeek[index + 2]),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.015,
                      )
                    ],
                  );
                },
                itemCount: maxTemperaturesOfTheWeek.length - 2,
              ),
            ),
          ],
        ));
      },
    );
  }
}
