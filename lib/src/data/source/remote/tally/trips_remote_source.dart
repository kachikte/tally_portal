import 'dart:developer';

import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/domain/domain.dart';

class TripsRemoteSource {
  BaseDio baseDio = BaseDio();

  getDrivers({required String token, required GetDriversDto getDriversDto}) async {
    baseDio.dio.options.headers["Authorization"] =
    "Bearer $token";
    return await baseDio.dio
        .post(ApiUrls.getDrivers, data: getDriversDto.toJson());
  }

  createTrip({required String token, required CreateTripDto createTripDto}) async {
    baseDio.dio.options.headers["Authorization"] =
    "Bearer $token";
    return await baseDio.dio
        .post(ApiUrls.createTrip, data: createTripDto.toJson());
  }

  getTrips({required String token}) async {
    log('trip ttoekm - $token');
    baseDio.dio.options.headers["Authorization"] =
    "Bearer $token";
    return await baseDio.dio
        .get(ApiUrls.getTrips);
  }
}
