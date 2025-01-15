import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/data/repository/signup_interface.dart';
import 'package:tally_portal/src/data/source/remote/remote.dart';
import 'package:tally_portal/src/data/source/remote/tally/signup_remote_source.dart';
import 'package:tally_portal/src/domain/domain.dart';

class TripsImpl extends TripsInterface {
  TripsRemoteSource tripsRemoteSource = TripsRemoteSource();

  @override
  Future<ResponseModel> getDrivers({required String token, required GetDriversDto getDriversDto}) async {
    ResponseModel responseModel = ResponseModel.empty();
    try {
      dio.Response response =
      await tripsRemoteSource.getDrivers(token: token, getDriversDto: getDriversDto);
      var signupData = json.decode(response.toString())['data'];
      responseModel.isError = false;
      responseModel.data = signupData;
      return responseModel;
    } on dio.DioError catch (e) {
      responseModel.isError = true;
      responseModel.data = json.decode(e.response.toString()) == null ? 'Error' : json.decode(e.response.toString())['data'];
      return responseModel;
    }
  }

  @override
  Future<ResponseModel> createTrip({required String token, required CreateTripDto createTripDto}) async {
    ResponseModel responseModel = ResponseModel.empty();
    try {
      dio.Response response =
      await tripsRemoteSource.createTrip(token: token, createTripDto: createTripDto);
      var signupData = json.decode(response.toString())['data'];
      responseModel.isError = false;
      responseModel.data = signupData;
      return responseModel;
    } on dio.DioError catch (e) {
      log('Create trips error - ${e.response.toString()}');
      responseModel.isError = true;
      responseModel.data = json.decode(e.response.toString()) == null ? 'Error' : json.decode(e.response.toString())['data'];
      return responseModel;
    }
  }

  @override
  Future getTrips({required String token}) async {
    // ResponseModel responseModel = ResponseModel.empty();
    return       await tripsRemoteSource.getTrips(token: token);

    // try {
    //   dio.Response response =
    //   await tripsRemoteSource.getTrips(token: token);
    //   var signupData = json.decode(response.toString())['data'];
    //   responseModel.isError = false;
    //   responseModel.data = signupData;
    //   return responseModel;
    // } on dio.DioError catch (e) {
    //   log('Create trips error - ${e.response.toString()}');
    //   responseModel.isError = true;
    //   // responseModel.data = json.decode(e.response.toString()) == null ? 'Error' : json.decode(e.response.toString())['data'];
    //   return responseModel;
    // }
  }
}
