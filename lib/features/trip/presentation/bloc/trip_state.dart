part of 'trip_bloc.dart';

abstract class TripState extends Equatable {
  const TripState();
}

class TripInitial extends TripState {
  @override
  List<Object> get props => [];
}

class LoadingState extends TripState {
  @override
  List<Object> get props => [];
}

class TripDataFetchedState extends TripState {
  final Trip trip;

  TripDataFetchedState({@required this.trip});

  @override
  List<Object> get props => [trip];
}

class ErrorState extends TripState {
  final String message;

  ErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}
