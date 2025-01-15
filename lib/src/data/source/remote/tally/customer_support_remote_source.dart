import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/domain/domain.dart';

class CustomerSupportRemoteSource {
  BaseDio baseDio = BaseDio();

  Future submitSupport(
      {required String authorization,
      required String accessToken,
      required CustomerSupportDto customerSupportDto}) async {
    baseDio.dio.options.headers["Authorization"] =
        "$authorization $accessToken";

    return await baseDio.dio
        .post(ApiUrls.createSupport, data: customerSupportDto.toJson());
  }
}
