class CarDocumentDto {
  String? userId;
  String? driversLicenseFileId;
  String? vehicleLicenseFileId;
  String? ownershipProofFileId;
  String? carExteriorFileId;
  String? carInteriorFileId;
  String? licenseNumber;
  String? expirationDate;

  CarDocumentDto(
      {required this.userId,
      required this.driversLicenseFileId,
      required this.vehicleLicenseFileId,
      required this.ownershipProofFileId,
      required this.carExteriorFileId,
      required this.carInteriorFileId,
      required this.licenseNumber,
      required this.expirationDate});

  toJson() {
    return {
      "userId": userId,
      "driversLicenseFileId": driversLicenseFileId,
      "vehicleLicenseFileId": vehicleLicenseFileId,
      "ownershipProofFileId": ownershipProofFileId,
      "carExteriorFileId": carExteriorFileId,
      "carInteriorFileId": carInteriorFileId,
      "licenseNumber": licenseNumber,
      "expirationDate": expirationDate,
    };
  }
}
