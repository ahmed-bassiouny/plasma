class User{
  int id;
  String name;
  String phone;
  int city;
  int bloodType;
  bool free;
  bool available;
  String note;

  User(){}

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"] == null ? 0 : json["id"],
        name = json["full_name"] == null ? "" : json["full_name"],
        phone = json["phone"] == null ? "" : json["phone"],
        city = json["city_index"] == null ? -1 : json["city_index"],
        bloodType = json["blood_specie_index"] == null ? -1 : json["blood_specie_index"],
        free = json["free_donation"],
        note = json["note"] == null ? "" : json["note"],
        available = json["available"];

  static List fromList(List list) {
    return list.map((item) {
      return User.fromJson(item);
    }).toList();
  }

  Map<String, dynamic> toJson() => {
    "full_name": name,
    "phone": phone,
    "note": note,
    "city_index":city,
    "blood_specie_index":bloodType,
    "free_donation":free,
    "available":available,
  };

}