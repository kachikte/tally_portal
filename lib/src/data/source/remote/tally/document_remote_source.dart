import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tally_portal/src/data/data.dart';

class DocumentRemoteSource {
  BaseDio baseDio = BaseDio();

  uploadSingle(
      {required File file,
      required String documentCategory,
      required String userId}) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
    });

    return await baseDio.dio.post(
        '${ApiUrls.singleUpload}/$documentCategory/$userId',
        data: formData);
  }
}
