class JoinRequestDTO {
  final String username;
  final String phone;
  final String password;
  final String name;
  final String birth;
  final String gender;
  final double height;

  JoinRequestDTO(
      {required this.username,
      required this.phone,
      required this.password,
      required this.name,
      required this.birth,
      required this.gender,
      required this.height});

  Map<String, dynamic> toJson() => {
        "username": username,
        "phone": phone,
        "password": password,
        "name": name,
        "birth": birth,
        "gender": gender,
        "height": height
      };
}

class UserUpdateRequestDTO {
  final int id;
  final String name;
  final String phone;
  final int password;
  final double height;
  final String userImg;

  UserUpdateRequestDTO(
      {required this.id,
      required this.name,
      required this.phone,
      required this.password,
      required this.height,
      required this.userImg});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "password": password,
        "height": height,
        "userImg": userImg
      };
}

class LoginRequestDTO {
  final String username;
  final String password;

  LoginRequestDTO(this.username, this.password);

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
