class User {
  late String firstName;
  late String lastName;
  late String email;
  late String token;

  User({required this.firstName, required this.lastName, required this.email});

  User.fromJsonWithToken(Map<String, dynamic> json,String _token) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    token = _token;
  }

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}
