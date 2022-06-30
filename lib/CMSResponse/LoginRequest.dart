
// ignore_for_file: file_names

class LoginRequest {
  String? email;
  String? password;
  String? grant_type;

  LoginRequest({
     this.email,
     this.password,
    this.grant_type,

  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email!.trim(),
      'password': password!.trim(),
      'grant_type': grant_type!.trim(),

    };

    return map;
  }
}