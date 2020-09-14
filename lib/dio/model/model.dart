class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({this.id, this.name, this.username, this.email, this.address, this.phone,
      this.website, this.company});

  User.fromJson(dynamic map) :
    this.id = map["id"],
    this.name = map["name"],
    this.username = map["username"],
    this.email = map["email"],
    this.address = Address.fromJson(map["address"]),
    this.phone = map["phone"],
    this.website = map["website"],
    this.company = Company.fromJson(map["company"]);

  static List<User> fromList(List list) =>
      list != null ? list.map((e) => User.fromJson(e)).toList() : [];
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(dynamic map) :
    this.street = map["street"],
    this.suite = map["suite"],
    this.city = map["city"],
    this.zipcode = map["zipcode"],
    this.geo = Geo.fromJson(map["geo"]);
}

class Geo {
  final String lat;
  final String lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(dynamic map) :
    this.lat = map["lat"],
    this.lng = map["lng"];
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(dynamic map) :
    this.name = map["name"],
    this.catchPhrase = map["catchPhrase"],
    this.bs = map["bs"];
}