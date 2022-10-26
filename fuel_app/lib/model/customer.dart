/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/

//Customer model
class Customer {
  int? userID;
  String? firstname;
  String? lastname;
  String? email;

  Customer({
    this.userID,
    this.firstname,
    this.lastname,
    this.email,
  });
  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      userID: map['userID'] != null ? map['userID'] as int : null,
      firstname: map['firstname'] != null ? map['firstname'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }
}
