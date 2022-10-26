/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/
//Common model for all users
class User {
  int? id;
  String? nic;
  String? password;
  int? userType;

  User({this.id,this.nic, this.password, this.userType});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      nic: map['nic'] != null ? map['nic'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      userType: map['userType'] != null ? map['userType'] as int : null,
    );
  }
}
