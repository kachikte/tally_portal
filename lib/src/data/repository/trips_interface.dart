import 'package:tally_portal/src/domain/domain.dart';

abstract class TripsInterface {
  Future<ResponseModel> getDrivers({required String token, required GetDriversDto getDriversDto});
  Future<ResponseModel> createTrip({required String token, required CreateTripDto createTripDto});
  Future getTrips({required String token});
}
