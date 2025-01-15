import 'package:get/get.dart';

class AppUserModel extends GetxController {
  late RxString firstName = ''.obs;
  late RxString imageUrl = ''.obs;
  late RxString lastName = ''.obs;
  late RxString roleId = ''.obs;
  late RxString email = ''.obs;
  late RxString phone = ''.obs;
  late RxString gender = ''.obs;
  late RxString brand = ''.obs;
  late RxString model = ''.obs;
  late RxString year = ''.obs;
  late RxString color = ''.obs;
  late RxString plateNumber = ''.obs;
  late RxString documentCategory = ''.obs;

  AppUserModel.empty();

   AppUserModel(
      {required this.firstName,
      required this.imageUrl,
      required this.lastName,
      required this.roleId,
      required this.email,
      required this.phone,
      required this.gender,
      required this.brand,
      required this.model,
      required this.year,
      required this.color,
      required this.plateNumber,
      required this.documentCategory});
}
