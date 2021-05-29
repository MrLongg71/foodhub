import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  User({
      this.id,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.username,
      this.userId,
      this.createdAt,
      this.updateAt,
      this.avatar,
      this.role,
      this.token});

  String? id;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? username;
  String? userId;
  String? createdAt;
  String? updateAt;
  String? avatar;
  String? role;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


}
