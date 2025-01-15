import 'package:get/get.dart';
import 'package:tally_portal/src/utils/utils.dart';

class GeneralController extends GetxController {
  static String? initialToken;
  static String? deepLink;
  static String? deepLinkScreenState;
  RxString selected = Constants.dashboard.obs;
}
