import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/domain/domain.dart';
import 'package:tally_portal/src/utils/utils.dart';

class TripController extends GetxController {
  Map<String, dynamic> bookedRide = {};

  RxInt completedTrips = 0.obs;
  RxInt unCompletedTrips = 0.obs;

  RxString selectedPaymentMethod = ''.obs;

  TripsImpl tripsImpl = TripsImpl();

  // Rx<DateTime> scheduledDate = DateTime.now().obs;
  // Rx<TimeOfDay> scheduledTime = TimeOfDay.now().obs;
  Rx<String> scheduledDate = ''.obs;
  Rx<String> scheduledTime = ''.obs;
  RxString startDestination = ''.obs;
  RxString endDestination = ''.obs;
  RxString rideType = Constants.requests.obs;
  RxBool isUpcoming = false.obs;
  RxBool showBottomDest = false.obs;
  RxString rideSchedule = Constants.now.obs;
  RxString carType = ''.obs;
  RxBool addedCard = false.obs;

  getDrivers({required GetDriversDto getDriversDto}) async {
    String? token = await SecuredStorage.readData(key: StoredKeys.TOKEN);

    ResponseModel responseModel =
        await tripsImpl.getDrivers(token: token!, getDriversDto: getDriversDto);

    return responseModel;
  }

  createTrip({required CreateTripDto createTripDto}) async {
    String? token = await SecuredStorage.readData(key: StoredKeys.TOKEN);

    ResponseModel responseModel =
        await tripsImpl.createTrip(token: token!, createTripDto: createTripDto);

    return responseModel;
  }

  getTrips() async {
    String? token = await SecuredStorage.readData(key: StoredKeys.TOKEN);
    return await tripsImpl.getTrips(token: token!);
    // ResponseModel responseModel =
    // await tripsImpl.getTrips(token: token!);
    //
    // return responseModel;
  }
}
