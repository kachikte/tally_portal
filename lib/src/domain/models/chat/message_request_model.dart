import 'package:tally_portal/src/utils/utils.dart';

class MessageRequestModel {
  String senderImageUrl = "";
  String senderUserName = "";
  String recieverImageUrl = "";
  String recieverUserName = "";
  String acceptDeny = StoredKeys.UNDECIDED;

  MessageRequestModel.fromVariables(
      {required this.senderImageUrl,
      required this.senderUserName,
      required this.recieverImageUrl,
      required this.recieverUserName});
}
