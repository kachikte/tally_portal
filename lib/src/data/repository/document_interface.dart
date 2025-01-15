import 'dart:io';

import 'package:tally_portal/src/domain/domain.dart';

abstract class DocumentInterface {
  Future<ResponseModel> uploadSingle(
      {required File file,
      required String documentCategory,
      required String userId});
}
