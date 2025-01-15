class CustomerSupportDto {
  String? ownerFirstname;
  String? ownerLastname;
  String? ownerPhone;
  String? ownerEmail;
  String? title;
  String? description;
  String? date;

  CustomerSupportDto(
      {required this.ownerFirstname,
      required this.ownerLastname,
      required this.ownerPhone,
      required this.ownerEmail,
      required this.title,
      required this.description,
      required this.date});

  toJson() {
    return {
      "ownerFirstname": ownerFirstname,
      "ownerLastname": ownerLastname,
      "ownerPhone": ownerPhone,
      "ownerEmail": ownerEmail,
      "title": title,
      "description": description,
      "date": date,
    };
  }
}
