import '../../../domain/models/response_model.dart';

abstract class FirebaseAuthInterface {
  Future<ResponseModel> getCurrentUser();

  Future<ResponseModel> getUsernameExistence(
      {required String username,
      required String email,
      required String password});

  Future<ResponseModel> createUserFireBase(
      {required String email,
      required String password,
      required String username});

  Future<ResponseModel> signInUserFireBase(
      {required String email, required String password});
}
