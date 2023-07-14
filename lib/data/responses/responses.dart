import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

// COMMAND TO GENERATE MISSLES
// flutter pub get
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "no_of_notifications")
  int? noOfNotifications;

  CustomerResponse(this.id, this.name, this.noOfNotifications);

  // FROM JSON
  factory CustomerResponse.fromJson(Map<String, dynamic> json) => _$CustomerResponseFromJson(json);

  // TO JSON
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactResponse {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "email")
  String? email;

  ContactResponse(this.phone, this.link, this.email);

  // FROM JSON
  factory ContactResponse.fromJson(Map<String, dynamic> json) => _$ContactResponseFromJson(json);

  // TO JSON
  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contact")
  ContactResponse? contact;

  AuthenticationResponse(this.customer, this.contact);

  // FROM JSON
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) => _$AuthenticationResponseFromJson(json);

  // TO JSON
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
