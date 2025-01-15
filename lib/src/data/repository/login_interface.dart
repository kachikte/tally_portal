import 'package:tally_portal/src/domain/domain.dart';

abstract class LoginInterface {
  Future<ResponseModel> login({required LoginDto loginDto});
}
