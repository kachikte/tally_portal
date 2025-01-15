class GetDriversDto {
  //Used to parse data to API

  late double originLng;
  late double originLat;
  late String originAddress;
  late String destinationAddress;
  late double destinationLng;
  late double destinationLat;
  late String tripType;
  late dynamic scheduledDate;
  late dynamic scheduledTime;

  GetDriversDto(
      {required this.originLng,
      required this.originLat,
      required this.originAddress,
      required this.destinationAddress,
      required this.destinationLat,
      required this.destinationLng,
        required this.scheduledTime,
        required this.scheduledDate,
      required this.tripType});

  toJson() {
    return {
      "originLng": originLng,
      "originLat": originLat,
      "originAddress": originAddress,
      "destinationAddress": destinationAddress,
      "destinationLng": destinationLng,
      "destinationLat": destinationLat,
      "scheduledDate": scheduledDate,
      "scheduledTime": scheduledTime,
      "tripType": tripType
    };
  }
}
