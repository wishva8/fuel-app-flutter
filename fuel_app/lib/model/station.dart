/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/

//Station model
class Station {
  int? userID;
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
      userID: map['userID'] != null ? map['userID'] as int : null,
      stationID: map['stationID'] != null ? map['stationID'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      ownerName: map['ownerName'] != null ? map['ownerName'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
    );
  }
}
