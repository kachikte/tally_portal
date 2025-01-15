class ChannelModel {
  String id = "";
  String username = "";
  String channelName = "";
  String channelStatus = "";

  ChannelModel.fromJson({required json}) {
    id = json["_id"];
    username = json["username"];
    channelName = json["channelName"];
    channelStatus = json["channelStatus"];
  }
}