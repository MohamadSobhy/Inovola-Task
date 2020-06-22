import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/trip.dart';
import '../repositories/trip_repository.dart';

class GetTripData extends UseCase<Trip, NoParams> {
  final TripRepository repository;

  GetTripData({@required this.repository});

  @override
  Future<Either<Failure, Trip>> call(NoParams params) {
    return repository.getTripData();
  }
}
