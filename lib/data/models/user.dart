class User {
  final int id;
  final String username;
  final String phone;
  final String password;
  final String name;
  final String birth;
  final String gender;
  final double height;

  final double? weight;
  final int? totalCoin;
  final double? goalMuscle;
  final double? goalFat;
  final String? createdAt;
  final String? userImg;

  User(
      {required this.id,
      required this.username,
      required this.phone,
      required this.password,
      required this.name,
      required this.birth,
      required this.gender,
      required this.height,
      required this.weight,
      required this.totalCoin,
      required this.goalMuscle,
      required this.goalFat,
      required this.createdAt,
      required this.userImg});

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "phone": phone,
        "password": password,
        "name": name,
        "birth": birth,
        "gender": gender,
        "height": height,
        "weight": weight,
        "totalCoin": totalCoin,
        "goalMuscle": goalMuscle,
        "goalFat": goalFat,
        "createdAt": createdAt,
        "userImg": userImg
      };

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        phone = json["phone"] ?? "",
        password = json["password"] ?? "",
        name = json["name"] ?? "",
        birth = json["birth"] ?? "",
        gender = json["gender"] ?? "",
        height = json["height"] ?? 0.0,
        weight = json["weight"] ?? 0.0,
        totalCoin = json["totalCoin"] ?? 0,
        goalMuscle = json["goalMuscle"] ?? 0,
        goalFat = json["goalFat"] ?? 0,
        createdAt = json["createdAt"] ?? "",
        userImg = json["userImg"] ?? "";

}
