class UserModel {
  int? id;
  String? name, username, email, phone, website;
  Address? address;
  Company? company;
  // static List<UserModel> finalData =
  // users.map((e) => UserModel.fromJson(e)).toList();

  UserModel(
      {required this.name,
      required this.username,
      required this.id,
      required this.email,
      required this.address,
      required this.company,
      required this.phone,
      required this.website});

  factory UserModel.fromJson(Map json) {
    return UserModel(
        name: json['name'],
        username: json['username'],
        id: json['id'],
        email: json['email'],
        address: Address.fromJson(json['address']),
        company: Company.fromJson(json['company']),
        phone: json['phone'],
        website: json['website']);
  }
}

class Address {
  String? street, suite, city, zipCode;
  Geo? geo;
  Address(
      {required this.street,
      required this.city,
      required this.geo,
      required this.suite,
      required this.zipCode});

  factory Address.fromJson(Map json) {
    return Address(
        street: json['street'],
        city: json['city'],
        geo: Geo.fromJson(json['geo']),
        suite: json['suite'],
        zipCode: json['zipcode']);
  }
}

class Geo {
  String? lat, lng;
  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map json) {
    return Geo(lat: json['lat'], lng: json['lng']);
  }
}

class Company {
  String? name, catchPhrase, bs;
  Company({required this.bs, required this.catchPhrase, required this.name});

  factory Company.fromJson(Map json) {
    return Company(
        name: json['name'], catchPhrase: json['catchPhrase'], bs: json['bs']);
  }
}
