import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/trip.dart';

abstract class TripRepository {
  Future<Either<Failure, Trip>> getTripData();
}
