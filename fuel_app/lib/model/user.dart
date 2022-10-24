class User {
  String? nic;
  String? password;
  int? userType;

  User({this.nic, this.password, this.userType});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nic: map['nic'] != null ? map['nic'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      userType: map['userType'] != null ? map['userType'] as int : null,
    );
  }
}
