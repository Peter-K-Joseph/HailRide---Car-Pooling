import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class InviteToGroupController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await Permission.location.request();
  }
}
