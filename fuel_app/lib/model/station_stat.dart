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
  var disal;
  var petrolWaitingTime;
  var disalWaitingTime;
  StationStat({
    required this.stationID,
    required this.location,
    required this.petrol,
    required this.disal,
    required this.petrolWaitingTime,
    required this.disalWaitingTime,
  });

  factory StationStat.fromJson(Map<dynamic, dynamic> json) {
    return StationStat(
      stationID:json['stationID'],
      location:json['location'],
      petrol:json['petrol'],
      disal:json['disal'],
      petrolWaitingTime:json['petrolWaitingTime'],
      disalWaitingTime:json['disalWaitingTime'],
    );
  }
}