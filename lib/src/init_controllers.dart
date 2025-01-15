import 'package:get/get.dart';
import 'package:tally_portal/src/presentation/controllers/controllers.dart';
import 'package:tally_portal/src/presentation/controllers/notification_controller.dart';
import 'package:tally_portal/src/presentation/controllers/support_controller.dart';

class InitControllers {
  InitControllers() {
    // NotificationController notificationController =
    // Get.put(NotificationController());
    SupportController supportController = Get.put(SupportController());
    ProfileController profileController = Get.put(ProfileController());
    GeneralController generalController = Get.put(GeneralController());
    OnboardingController onboardingController = Get.put(OnboardingController());
    SignupController signupController = Get.put(SignupController());
    LoginController loginController = Get.put(LoginController());
    TripController tripController = Get.put(TripController());
    DocumentController documentController = Get.put(DocumentController());
  }
}
