import 'package:dio/dio.dart';
import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/domain/domain.dart';

class LoginRemoteSource {
  BaseDio baseDio = BaseDio();

  Future<Response<dynamic>> login({required LoginDto loginDto}) async {
    print("this is coming hereeee == | 222");

    return await baseDio.dio.post(ApiUrls.login, data: loginDto.toJson());
  }
}
