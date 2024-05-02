class LocationRespone {
  List<Features>? features;
  String? type;

  LocationRespone({this.features, this.type});

  LocationRespone.fromJson(Map<String, dynamic> json) {
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    return data;
  }
}

class Features {
  Geometry? geometry;
  String? type;
  Properties? properties;

  Features({this.geometry, this.type, this.properties});

  Features.fromJson(Map<String, dynamic> json) {
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    data['type'] = this.type;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    return data;
  }
}

class Geometry {
  List<double>? coordinates;
  String? type;

  Geometry({this.coordinates, this.type});

  Geometry.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}

class Properties {
  String? osmType;
  int? osmId;
  String? country;
  String? osmKey;
  String? city;
  String? countrycode;
  String? osmValue;
  String? postcode;
  String? name;
  String? state;
  String? type;
  List<double>? extent;
  String? district;
  String? street;

  Properties(
      {this.osmType,
        this.osmId,
        this.country,
        this.osmKey,
        this.city,
        this.countrycode,
        this.osmValue,
        this.postcode,
        this.name,
        this.state,
        this.type,
        this.extent,
        this.district,
        this.street});

  Properties.fromJson(Map<String, dynamic> json) {
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    country = json['country'];
    osmKey = json['osm_key'];
    city = json['city'];
    countrycode = json['countrycode'];
    osmValue = json['osm_value'];
    postcode = json['postcode'];
    name = json['name'];
    state = json['state'];
    type = json['type'];
    extent = json['extent'].cast<double>();
    district = json['district'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['osm_type'] = this.osmType;
    data['osm_id'] = this.osmId;
    data['country'] = this.country;
    data['osm_key'] = this.osmKey;
    data['city'] = this.city;
    data['countrycode'] = this.countrycode;
    data['osm_value'] = this.osmValue;
    data['postcode'] = this.postcode;
    data['name'] = this.name;
    data['state'] = this.state;
    data['type'] = this.type;
    data['extent'] = this.extent;
    data['district'] = this.district;
    data['street'] = this.street;
    return data;
  }
}
