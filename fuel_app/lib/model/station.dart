class Station {
  String? userID;
  String? stationID;
  String? name;
  String? ownerName;
  String? location;

  Station({
    this.userID,
    this.stationID,
    this.name,
    this.ownerName,
    this.location,
  });
  factory Station.fromMap(Map<String, dynamic> map) {
    return Station(
      userID: map['userID'] != null ? map['userID'] as String : null,
      stationID: map['stationID'] != null ? map['stationID'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      ownerName: map['ownerName'] != null ? map['ownerName'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
    );
  }
}
