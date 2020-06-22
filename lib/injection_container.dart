import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'features/trip/data/datasources/trip_remote_data_source.dart';
import 'features/trip/data/repositories/trip_repository_impl.dart';
import 'features/trip/domain/repositories/trip_repository.dart';
import 'features/trip/domain/usecases/get_trip_data_usecase.dart';
import 'features/trip/presentation/bloc/trip_bloc.dart';

final serviceLocator = GetIt.instance;

void init() {
  serviceLocator.registerFactory(
    () => TripBloc(
      getTripData: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetTripData(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<TripRepository>(
    () => TripRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<TripRemoteDataSource>(
    () => TripRemoteDataSourceImpl(
      httpClient: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  serviceLocator.registerLazySingleton(() => http.Client());
}
