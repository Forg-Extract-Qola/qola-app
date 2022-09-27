class LoginModel {
  String? email;
  String? password;
  String? code;
  String? token;

  LoginModel({
    this.email,
    this.password,
    this.code,
    this.token
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json["token"];
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "code": code
  };
}