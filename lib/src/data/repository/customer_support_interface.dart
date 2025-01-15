import 'package:tally_portal/src/domain/domain.dart';

abstract class CustomerSupportInterface {
  Future<ResponseModel> submitSupport(
      {required String authorization,
      required String accessToken,
      required CustomerSupportDto customerSupportDto});
}
