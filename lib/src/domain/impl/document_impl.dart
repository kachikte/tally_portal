import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/domain/domain.dart';

class DocumentImpl extends DocumentInterface {
  DocumentRemoteSource documentRemoteSource = DocumentRemoteSource();

  @override
  Future<ResponseModel> uploadSingle(
      {required File file,
      required String documentCategory,
      required String userId}) async {
    ResponseModel responseModel = ResponseModel.empty();
    try {
      dio.Response response = await documentRemoteSource.uploadSingle(
          file: file, documentCategory: documentCategory, userId: userId);
      var documentData = json.decode(response.toString())['data'];
      responseModel.isError = false;
      responseModel.data = documentData;
      return responseModel;
    } on dio.DioError catch (e) {
      responseModel.isError = true;
      responseModel.data = json.decode(e.response.toString())['data'];
      return responseModel;
    }
  }
}
