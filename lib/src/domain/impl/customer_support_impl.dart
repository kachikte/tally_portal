import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:tally_portal/src/data/repository/customer_support_interface.dart';
import 'package:tally_portal/src/data/source/remote/tally/customer_support_remote_source.dart';
import 'package:tally_portal/src/domain/domain.dart';

class CustomerSupportImpl implements CustomerSupportInterface {
  CustomerSupportRemoteSource customerSupportRemoteSource =
      CustomerSupportRemoteSource();

  @override
  Future<ResponseModel> submitSupport(
      {required String authorization,
      required String accessToken,
      required CustomerSupportDto customerSupportDto}) async {
    ResponseModel responseModel = ResponseModel.empty();

    try {
      dio.Response response = await customerSupportRemoteSource.submitSupport(
          authorization: authorization,
          accessToken: accessToken,
          customerSupportDto: customerSupportDto);
      responseModel.isError = false;
      responseModel.data = response.data;
    } on dio.DioError catch (e) {
      responseModel.isError = true;
      responseModel.data = json.decode(e.response.toString())['data'];
    }

    return responseModel;
  }
}
