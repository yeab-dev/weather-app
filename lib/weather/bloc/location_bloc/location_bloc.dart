import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather/models/models.dart';
import 'package:weather/weather/repositories/locators/locators.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationInitial()) {
    on<LocationRetrivalRequested>(_onLocationRetrivalRequested);
  }

  void _onLocationRetrivalRequested(
      LocationRetrivalRequested event, Emitter emit) async {
    Location? location = await LocationRepositoryLocator.locationRepository
        .getCurrentPosition()
        .catchError((e, st) {
      log("catched error $e");
      emit(LocationLoadFailure(error: e));
      return null;
    });
    if (location != null) {
      emit(LocationLoadSuccess(location: location));
    }
  }
}
