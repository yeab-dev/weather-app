part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState({required this.location, required this.error});
  final Location? location;
  final String? error;

  @override
  List<Object?> get props => [location];
}

final class LocationInitial extends LocationState {
  const LocationInitial() : super(location: null, error: null);
}

final class LocationLoadSuccess extends LocationState {
  const LocationLoadSuccess({required Location location})
      : super(location: location, error: null);
}

final class LocationLoadFailure extends LocationState {
  const LocationLoadFailure({required String error})
      : super(location: null, error: error);
}
