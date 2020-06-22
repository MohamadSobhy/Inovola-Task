import 'dart:convert';

import 'package:inovola_interview_task/core/errors/exceptions.dart';

import '../models/trip_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class TripRemoteDataSource {
  /// fetches https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34 endpoint
  ///
  /// returns a [TripModel] instance that holds the trip data.
  /// throws [ServerException] for all error codes.
  Future<TripModel> fetchTripData();
}

const String API_ENDPOINT =
    'https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34';
const String FETCHING_DATA_FAILED_MESSAGE = 'Failed to fetch trip data.';

class TripRemoteDataSourceImpl implements TripRemoteDataSource {
  final http.Client httpClient;

  TripRemoteDataSourceImpl({@required this.httpClient});

  @override
  Future<TripModel> fetchTripData() async {
    final response = await httpClient.get(API_ENDPOINT);

    if (response.statusCode == 200) {
      //parse Trip model and return
      Map<String, dynamic> parsedJson = json.decode(response.body);
      final tripModel = TripModel.fromJson(parsedJson);
      return tripModel;
    } else {
      String message;
      if (response.body != null) {
        message = response.body;
      } else {
        message = FETCHING_DATA_FAILED_MESSAGE;
      }
      throw ServerException(message: message);
    }
  }
}
