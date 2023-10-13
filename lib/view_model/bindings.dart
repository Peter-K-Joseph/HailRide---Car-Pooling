import 'package:get/get.dart';
import 'package:hailride/view_model/dashboard.dart';
import 'package:hailride/view_model/home.dart';
import 'package:hailride/view_model/login_signup_controller.dart';
import 'package:hailride/view_model/messages.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController(), permanent: true);
    Get.put(MessageController(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}

class InviteToGroupBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController(), permanent: true);
  }
}

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class OTPRequestBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OTPRequestController());
  }
}

class SetupScreenControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SetupScreenController());
  }
}
