/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/
//Station statistic model for display Station details
class StationStat {
  var stationID;
  var location;
  var petrol;
  var diesel;
  var petrolWaitingTime;
  var dieselWaitingTime;
  StationStat({
    required this.stationID,
    required this.location,
    required this.petrol,
    required this.diesel,
    required this.petrolWaitingTime,
    required this.dieselWaitingTime,
  });

  factory StationStat.fromJson(Map<dynamic, dynamic> json) {
    return StationStat(
      stationID:json['stationId'],
      location:json['location'],
      petrol:json['petrol'],
      diesel:json['diesel'],
      petrolWaitingTime:json['petrolWaitingTime'],
      dieselWaitingTime:json['dieselWaitingTime'],
    );
  }
}