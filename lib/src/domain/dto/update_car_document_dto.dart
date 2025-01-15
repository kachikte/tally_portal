class UpdateCarDocumentDto {
  String? brand;
  String? model;
  String? year;
  String? color;
  String? vehicleLicenseFileId;
  String? ownershipProofFileId;
  String? carExteriorFileId;
  String? carInteriorFileId;
  String? plateNumber;

  UpdateCarDocumentDto(
      {required this.brand,
      required this.model,
      required this.year,
      required this.color,
      required this.vehicleLicenseFileId,
      required this.ownershipProofFileId,
      required this.carExteriorFileId,
      required this.carInteriorFileId,
      required this.plateNumber});

  toJson() {
    return {
      "brand": brand,
      "model": model,
      "year": year,
      "color": color,
      "vehicleLicenseFileId": vehicleLicenseFileId,
      "ownershipProofFileId": ownershipProofFileId,
      "carExteriorFileId": carExteriorFileId,
      "carInteriorFileId": carInteriorFileId,
      "plateNumber": plateNumber,
    };
  }
}
