class DriverOtherInfoDto {
  String? userId;
  String? governmentIdNumber;
  String? nkFullName;
  String? nkEmail;
  String? nkPhoneNumber;
  String? nkRelationship;
  String? governmentFile;
  String? profileFile;

  DriverOtherInfoDto(
      {required this.userId,
      required this.governmentIdNumber,
      required this.nkFullName,
      required this.nkEmail,
      required this.nkPhoneNumber,
      required this.nkRelationship,
      required this.governmentFile,
      required this.profileFile});

  toJson() {
    return {
      "userId": userId,
      "governmentIdNumber": governmentIdNumber,
      "nkFullName": nkFullName,
      "nkEmail": nkEmail,
      "nkPhoneNumber": nkPhoneNumber,
      "nkRelationship": nkRelationship,
      "governmentFile": governmentFile,
      "profileFile": profileFile,
    };
  }
}
