part of 'trip_bloc.dart';

abstract class TripEvent extends Equatable {
  const TripEvent();
}

class GetTripDataEvent extends TripEvent {
  @override
  List<Object> get props => [];
}
