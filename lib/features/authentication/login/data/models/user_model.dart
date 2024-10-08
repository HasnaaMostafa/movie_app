class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerified;
  String? image;
  String? bio;
  String? cover;
  bool? isAgree;

  UserModel({
    this.name,
    this.uId,
    this.email,
    this.phone,
    this.isEmailVerified,
    this.image,
    this.bio,
    this.cover,
    this.isAgree,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    name = json["name"];
    phone = json["phone"];
    uId = json["uId"];
    isEmailVerified = json["isEmailVerified"];
    image = json["image"];
    bio = json["bio"];
    cover = json["cover"];
    isAgree = json["isAgree"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "uId": uId,
      "isEmailVerified": isEmailVerified,
      "image": image,
      "bio": bio,
      "cover": cover,
      "isAgree": isAgree
    };
  }
}
