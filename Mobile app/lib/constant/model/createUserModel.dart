class UserInfoData {
  String firstName;
  String lastName;
  String? dateTime;
  String? emailAddress;
  String? gender;

  UserInfoData({
    required this.firstName,
    required this.lastName,
    required this.dateTime,
    required this.emailAddress,
    required this.gender,
  });

  static UserInfoData fromJson(Map<String, dynamic> json) => UserInfoData(
    firstName: json['First Name'],
    dateTime: json['birth Date'],
    emailAddress: json['email address'],
    gender: json['gender'],
    lastName: json['last Name'],
  );

  Map<String, dynamic> toMap() {
    return {
      'First Name': firstName,
      'last Name': lastName,
      'birth Date': dateTime,
      'email address': emailAddress,
      'gender': gender,
    };
  }
}
