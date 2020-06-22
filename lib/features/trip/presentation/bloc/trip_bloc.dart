import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:inovola_interview_task/core/usecases/usecase.dart';
import 'package:inovola_interview_task/features/trip/domain/usecases/get_trip_data_usecase.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:inovola_interview_task/features/trip/domain/entities/trip.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final GetTripData getTripData;

  TripBloc({@required this.getTripData});

  @override
  TripState get initialState => TripInitial();

  @override
  Stream<TripState> mapEventToState(
    TripEvent event,
  ) async* {
    if (event is GetTripDataEvent) {
      yield LoadingState();

      final tripEither = await getTripData(NoParams());

      yield tripEither.fold(
        (failure) => ErrorState(message: failure.message),
        (trip) => TripDataFetchedState(trip: trip),
      );
    }
  }
}
