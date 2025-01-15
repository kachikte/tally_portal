import 'package:tally_portal/src/domain/domain.dart';

abstract class FirebaseAnalyticsInterface {
  Future<ResponseModel> addAppOpenAnalytics();

  Future<ResponseModel> addLoginAnalytics(
      {required String firstName,
      required String lastName,
      required String username});

  Future<ResponseModel> addLogoutAnalytics(
      {required String firstName,
      required String lastName,
      required String username});

  Future<ResponseModel> addSupportTicketAnalytics(
      {required String firstName,
      required String lastName,
      required String username});

  Future<ResponseModel> addBillingTicketAnalytics(
      {required String firstName,
      required String lastName,
      required String username});

  Future<ResponseModel> addCallsInitiatedAnalytics(
      {required String firstName,
      required String lastName,
      required String username});

  Future<ResponseModel> addChatsInitiatedAnalytics(
      {required String firstName,
      required String lastName,
      required String username});

  Future<ResponseModel> randomLogAnalytics();
}
