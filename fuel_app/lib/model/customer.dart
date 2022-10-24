class Customer {
  String? userID;
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
      userID: map['userID'] != null ? map['userID'] as String : null,
      firstname: map['firstname'] != null ? map['firstname'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }
}
