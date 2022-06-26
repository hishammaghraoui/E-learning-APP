class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String ID;
   String name;
   String email;
   String firstpassword;
   String CIN;
   String CNE;
   String type ;
   String phoneNumber;
   String classID;
   String Avatar="images/defaul.jpg";

  LoginRequestModel({this.ID, this.name, this.email, this.firstpassword,
      this.CIN, this.CNE, this.type, this.phoneNumber, this.classID,}
      );
  //
  // LoginRequestModel({
  //   this.email,
  //   this.password,
  // });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'firstpassword': firstpassword.trim(),
    };

    return map;
  }
}