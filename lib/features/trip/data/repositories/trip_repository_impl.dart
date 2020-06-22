import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/trip.dart';
import '../../domain/repositories/trip_repository.dart';
import '../datasources/trip_remote_data_source.dart';

const NO_INTERNET_CONNECTION =
    'Connection failed: please check internet network.';

class TripRepositoryImpl implements TripRepository {
  final NetworkInfo networkInfo;
  final TripRemoteDataSource remoteDataSource;

  TripRepositoryImpl({
    @required this.networkInfo,
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Trip>> getTripData() async {
    if (await networkInfo.isConnected) {
      final trip = await remoteDataSource.fetchTripData();
      return Right(trip);
    } else {
      return Left(ServerFailure(message: NO_INTERNET_CONNECTION));
    }
  }
}
