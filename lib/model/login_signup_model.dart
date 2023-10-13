import 'package:get/get.dart';

class LoginModel {
  RxBool isPasswordVisible = true.obs;
}

class SignupModel {
  RxBool isPasswordVisible = false.obs;
}

class OTPRequestModel {
  String email;
  String name;
  String password;
  String phone;

  OTPRequestModel({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
        "phone": phone,
      };
}

class SetupScreenModel {
  String email;
  String? name;
  String admissionNo;
  String domain;
  String? class_;
  String? yearOfGraduation;
  String? course;
  String? branch;
  DateTime? dob;

  SetupScreenModel({
    required this.email,
    required this.admissionNo,
    required this.domain,
  });
}

class BranchModel {
  String branchName;
  String departmentName;

  BranchModel({
    required this.branchName,
    required this.departmentName,
  });

  Map<String, dynamic> toJson() => {
        "branchName": branchName,
        "departmentName": departmentName,
      };

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        branchName: json["branchName"],
        departmentName: json["departmentName"],
      );
}
