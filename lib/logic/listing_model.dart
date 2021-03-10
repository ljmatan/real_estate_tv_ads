import 'dart:convert';

Franklin franklinFromJson(String str) => Franklin.fromJson(json.decode(str));

class Franklin {
  Franklin({this.listings});

  FranklinListings listings;

  factory Franklin.fromJson(Map<String, dynamic> json) => Franklin(
        listings: json["listings"] == null
            ? null
            : FranklinListings.fromJson(json["listings"]),
      );
}

class FranklinListings {
  FranklinListings({this.ids, this.listings});

  Ids ids;
  ListingsListings listings;

  factory FranklinListings.fromJson(Map<String, dynamic> json) =>
      FranklinListings(
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
        listings: json["listings"] == null
            ? null
            : ListingsListings.fromJson(json["listings"]),
      );
}

class Ids {
  Ids({this.id});

  List<Id> id;

  factory Ids.fromJson(Map<String, dynamic> json) => Ids(
        id: json["id"] == null
            ? null
            : List<Id>.from(json["id"].map((x) => Id.fromJson(x))),
      );
}

class Id {
  Id({this.t});

  String t;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        t: json["\u0024t"] == null ? null : json["\u0024t"],
      );
}

class ListingsListings {
  ListingsListings({
    this.listing,
  });

  List<Listing> listing;

  factory ListingsListings.fromJson(Map<String, dynamic> json) =>
      ListingsListings(
        listing: json["listing"] == null
            ? null
            : List<Listing>.from(
                json["listing"].map((x) => Listing.fromJson(x))),
      );
}

class Listing {
  Listing({
    this.id,
    this.idType,
    this.category,
    this.datePosted,
    this.dateUpdated,
    this.name,
    this.html,
    this.transaction,
    this.squareSizeUnit,
    this.plotSquareSizeUnit,
    this.currency,
    this.price,
    this.pricePrevious,
    this.bathrooms,
    this.toiletRooms,
    this.idCode,
    this.rooms,
    this.bedrooms,
    this.squareSize,
    this.plotSquareSize,
    this.floor,
    this.location,
    this.attributes,
    this.files,
    this.users,
  });

  Id id;
  Id idType;
  Category category;
  Id datePosted;
  Id dateUpdated;
  Category name;
  Category html;
  Id transaction;
  Id squareSizeUnit;
  Id plotSquareSizeUnit;
  Id currency;
  Id price;
  Id pricePrevious;
  Id idCode;
  Id rooms;
  Id bedrooms;
  Id bathrooms;
  Id toiletRooms;
  Id squareSize;
  Id plotSquareSize;
  Id floor;
  Location location;
  Attributes attributes;
  Files files;
  Users users;

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        id: json["id"] == null ? null : Id.fromJson(json["id"]),
        idType: json["id_type"] == null ? null : Id.fromJson(json["id_type"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        datePosted: json["date_posted"] == null
            ? null
            : Id.fromJson(json["date_posted"]),
        dateUpdated: json["date_updated"] == null
            ? null
            : Id.fromJson(json["date_updated"]),
        name: json["name"] == null ? null : Category.fromJson(json["name"]),
        html: json["html"] == null ? null : Category.fromJson(json["html"]),
        transaction: json["transaction"] == null
            ? null
            : Id.fromJson(json["transaction"]),
        squareSizeUnit: json["square_size_unit"] == null
            ? null
            : Id.fromJson(json["square_size_unit"]),
        plotSquareSizeUnit: json["plot_square_size_unit"] == null
            ? null
            : Id.fromJson(json["plot_square_size_unit"]),
        currency:
            json["currency"] == null ? null : Id.fromJson(json["currency"]),
        price: json["price"] == null ? null : Id.fromJson(json["price"]),
        pricePrevious: json["price_previous"] == null
            ? null
            : Id.fromJson(json["price_previous"]),
        idCode: json["id_code"] == null ? null : Id.fromJson(json["id_code"]),
        rooms: json["rooms"] == null ? null : Id.fromJson(json["rooms"]),
        bedrooms:
            json["bedrooms"] == null ? null : Id.fromJson(json["bedrooms"]),
        squareSize: json["square_size"] == null
            ? null
            : Id.fromJson(json["square_size"]),
        bathrooms:
            json["bathrooms"] == null ? null : Id.fromJson(json["bathrooms"]),
        toiletRooms: json["toiletrooms"] == null
            ? null
            : Id.fromJson(json["toiletrooms"]),
        plotSquareSize: json["plot_square_size"] == null
            ? null
            : Id.fromJson(json["plot_square_size"]),
        floor: json["floor"] == null ? null : Id.fromJson(json["floor"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
        files: json["files"] == null ? null : Files.fromJson(json["files"]),
        users: json["users"] == null ? null : Users.fromJson(json["users"]),
      );
}

class Attributes {
  Attributes({this.attribute});

  List<Attribute> attribute;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        attribute: json["attribute"] == null
            ? null
            : List<Attribute>.from(
                json["attribute"].map((x) => Attribute.fromJson(x))),
      );
}

class Attribute {
  Attribute({this.name, this.value});

  String name;
  String value;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        name: json["name"] == null ? null : json["name"],
        value: json["value"] == null ? null : json["value"],
      );
}

class Category {
  Category({this.hr, this.en, this.de});

  De hr, en, de;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        hr: json["hr"] == null ? null : De.fromJson(json["hr"]),
        en: json["en"] == null ? null : De.fromJson(json["en"]),
        de: json["de"] == null ? null : De.fromJson(json["de"]),
      );
}

class De {
  De({this.cdata});

  String cdata;

  factory De.fromJson(Map<String, dynamic> json) => De(
        cdata: json["__cdata"] == null ? null : json["__cdata"],
      );
}

class Files {
  Files({this.files});

  List<FileElement> files;

  factory Files.fromJson(dynamic json) => Files(
        files: json["file"] == null
            ? null
            : (json["file"].toString().startsWith('{'))
                ? <FileElement>[
                    FileElement(
                      publish: json["file"]["publish"],
                      t: json["file"]["\u0024t"],
                    ),
                  ]
                : <FileElement>[
                    for (var file in json["file"])
                      FileElement(
                        publish: file["publish"],
                        t: file["\u0024t"],
                      ),
                  ],
      );
}

class FileElement {
  FileElement({this.publish, this.t});

  String publish;
  String t;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        publish: json["publish"] == null ? null : json["publish"],
        t: json["\u0024t"] == null ? null : json["\u0024t"],
      );
}

class Location {
  Location({this.region, this.city, this.town});

  Id region, city, town;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        region: json["region"] == null ? null : Id.fromJson(json["region"]),
        city: json["city"] == null ? null : Id.fromJson(json["city"]),
        town: json["town"] == null ? null : Id.fromJson(json["town"]),
      );
}

class Users {
  Users({this.user});

  User user;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );
}

class User {
  User({this.name, this.lastName, this.email, this.cdata});

  String name;
  String lastName;
  String email;
  String cdata;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        cdata: json["__cdata"] == null ? null : json["__cdata"],
      );
}
