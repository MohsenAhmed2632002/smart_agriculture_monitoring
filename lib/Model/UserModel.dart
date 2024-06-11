// ignore_for_file: unnecessary_null_comparison

class UserModel {
  late String name;
  late String email;
  late String userId;

  UserModel({
    required this.name,
    required this.email,
    required this.userId,
  });

  UserModel.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    } else {
      name = map["name"];
      email = map["email"];
      userId = map["userId"];
    }
  }
  toJson() {
    return {
      "name": name,
      "email": email,
      "userId": userId,
    };
  }
}
