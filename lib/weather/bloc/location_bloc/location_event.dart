part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent({required this.location});
  final Location? location;

  @override
  List<Object?> get props => [location];
}

final class LocationRetrivalRequested extends LocationEvent {
  const LocationRetrivalRequested() : super(location: null);
}
