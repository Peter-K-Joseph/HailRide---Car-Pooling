import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hailride/model/login_signup_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hailride/view/alerts.dart';

class AuthService {
  // Google sign in controllers
  Future<String> signInUsingEmailAndPasswordFirebase(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthMultiFactorException catch (e) {
      AlertingServices().alertingMesseger(
        "error",
        "Error",
        "Multi factor authentication required",
        Icons.error,
      );
      return e.code;
    } on FirebaseAuthException catch (e) {
      print("Sign in error: $e");
      return e.code;
    }
    return "success";
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUpWithEmailAndPasswordFirebase(
      String email, String password, String phone, String name) async {
    try {
      // Create user account with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user ID
      String userId = userCredential.user!.uid;

      // Add user data to Firestore
      await _firestore.collection('users').doc(userId).set({
        'name': name,
        'phone': phone,
        'email': email,
        'rides': [],
        'posted_rides': [],
        'emergency_contacts': [],
      });
    } catch (e) {
      print('Error signing up with email and password: $e');
    }
  }

  User getCurrentlySignedInUser() {
    return FirebaseAuth.instance.currentUser!;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future ensureUserInitialised({
    required String uid,
    required String domain,
    required String name,
    required String email,
    String? profile,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      if ((await firestore.collection('users').doc(uid).get()).data() == null) {
        await firestore.collection('users').doc(uid).set({
          'name': name,
          'email': email,
          'admno': null,
          'photoURL': profile,
          'uid': uid,
          'domain': domain,
          'branch': null,
          'department': null,
          'yearOfGraduation': null,
          'friends': [],
          'groups': [],
          'events': [],
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}

class LoginController extends GetxController {
  LoginModel model = LoginModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    model.isPasswordVisible.value = !model.isPasswordVisible.value;
  }

  bool getPasswordVisibilityStatus() {
    return model.isPasswordVisible.value;
  }
}

class SignUpController extends GetxController {
  SignupModel model = SignupModel();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    model.isPasswordVisible.value = !model.isPasswordVisible.value;
  }

  bool getPasswordVisibilityStatus() {
    return model.isPasswordVisible.value;
  }
}

class OTPRequestController extends GetxController {
  OTPRequestModel? model;
  RxString resendTimer = "Resend OTP in 01:00".obs;
  TextEditingController otpController = TextEditingController();
  Timer? timer;
  int timerCount = 60;
  final List<FocusNode> otpInputFocusNodes =
      List.generate(6, (index) => FocusNode());
  final List<TextEditingController> otpInputControllers =
      List.generate(6, (index) => TextEditingController());
  final RxList<Color> otpInputColors =
      List.generate(6, (index) => Colors.grey).obs;
  bool isLoading = false;

  void setModel(OTPRequestModel model) {
    this.model = model;
  }

  void startTimer() {
    timerCount = 60;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timerCount == 1) {
          timer.cancel();
          resendTimer.value = "Resend OTP";
        } else {
          timerCount--;
          int minutes = timerCount ~/ 60;
          if (timerCount < 10) {
            resendTimer.value =
                "Resend OTP in ${(minutes > 9) ? minutes : '0$minutes'}:0$timerCount";
          } else {
            resendTimer.value =
                "Resend OTP in ${(minutes > 9) ? minutes : '0$minutes'}:$timerCount";
          }
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
    for (int i = 0; i < 6; i++) {
      otpInputControllers[i].addListener(() {
        if (otpInputControllers[i].text.length == 1) {
          if (int.tryParse(otpInputControllers[i].text) == null) {
            otpInputControllers[i].text = "";
            errorIndicator();
            return;
          }
          if (i != 5) {
            if (otpInputFocusNodes[i].hasFocus) {
              otpInputControllers[i + 1].text = "";
              otpInputFocusNodes[i + 1].requestFocus();
            }
            return;
          }
        }
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }

  void loadingIndicator() {
    void changeColor(int i) {
      Future.delayed(
        const Duration(milliseconds: 80),
        () {
          otpInputColors[i] =
              (otpInputColors[i] == Colors.blue) ? Colors.grey : Colors.blue;

          if (!isLoading) {
            for (int i = 0; i < 6; i++) {
              otpInputColors[i] = Colors.grey;
            }
          } else {
            (i == 5) ? changeColor(0) : changeColor(i + 1);
          }
        },
      );
    }

    changeColor(0);
  }

  void errorIndicator() {
    int tries = 0;

    void changeColor() {
      for (int i = 0; i < 6; i++) {
        otpInputColors[i] =
            (otpInputColors[i] == Colors.red) ? Colors.grey : Colors.red;
      }
      if (tries < 5) {
        tries++;
        Future.delayed(
          const Duration(milliseconds: 100),
          () {
            changeColor();
          },
        );
      }
    }

    changeColor();
  }

  Future<bool> verifyOTP() async {
    String otp =
        otpInputControllers.map((controller) => controller.text).join();
    if (otp.length != 6) {
      errorIndicator();
      return false;
    }
    for (int i = 0; i < 6; i++) {
      otpInputFocusNodes[i].unfocus();
    }
    isLoading = true;
    loadingIndicator();
    return Future.delayed(
      const Duration(seconds: 4),
      () {
        isLoading = false;
        return Future.delayed(
          const Duration(milliseconds: 420),
          () {
            errorIndicator();
            return true;
          },
        );
      },
    );
  }
}

class AccountVerifiedController extends GetxController {}

class SetupScreenController extends GetxController {
  TextEditingController nameController = TextEditingController();
  Rx<TextEditingController> department = TextEditingController().obs;
  Rx<TextEditingController> branch = TextEditingController().obs;
  TextEditingController yearOfGraduation = TextEditingController();
  RxList<BranchModel> branchList = <BranchModel>[
    BranchModel(
        branchName: "BTech in Computer Science and Engineering",
        departmentName: "Department of Computer Science and Engineering"),
    BranchModel(
        branchName: "BTech in Electronics and Communication Engineering",
        departmentName: "Department of Electronics and Electrical Engineering"),
    BranchModel(
        branchName: "BTech in Mechanical Engineering",
        departmentName: "Department of Mechanical Engineering"),
    BranchModel(
        branchName: "BTech in Civil Engineering",
        departmentName: "Department of Mechanical Engineering"),
    BranchModel(
        branchName: "BTech in Electrical Engineering",
        departmentName: "Department of Electronics and Electrical Engineering"),
    BranchModel(
        branchName: "BTech in Chemical Engineering",
        departmentName: "Department of Mechanical Engineering"),
    BranchModel(
        branchName: "BTech in Biotechnology",
        departmentName: "Department of Mechanical Engineering"),
    BranchModel(
        branchName: "MTech in Computer Science and Engineering",
        departmentName: "Department of Computer Science and Engineering"),
    BranchModel(
        branchName: "MTech in Electronics and Communication Engineering",
        departmentName: "Department of Electronics and Electrical Engineering"),
    BranchModel(
        branchName: "MTech in Mechanical Engineering",
        departmentName: "Department of Mechanical Engineering"),
    BranchModel(
        branchName: "MTech in Civil Engineering",
        departmentName: "Department of Mechanical Engineering"),
    BranchModel(
        branchName: "MTech in Electrical Engineering",
        departmentName: "Department of Electronics and Electrical Engineering"),
    BranchModel(
        branchName: "MTech in Chemical Engineering",
        departmentName: "Department of Mechanical Engineering"),
    BranchModel(
        branchName: "MTech in Biotechnology",
        departmentName: "Department of Mechanical Engineering"),
    BranchModel(
        branchName: "MBA", departmentName: "Department of Business Studies"),
    BranchModel(
        branchName: "MSc in Physics",
        departmentName: "Department of Science and Humanities"),
    BranchModel(
        branchName: "MSc in Chemistry",
        departmentName: "Department of Science and Humanities"),
    BranchModel(
        branchName: "MSc in Mathematics",
        departmentName: "Department of Science and Humanities"),
    BranchModel(
        branchName: "MSc in Psychology",
        departmentName: "Department of Psychology"),
    BranchModel(
        branchName: "MSc in Economics",
        departmentName: "Department of Science and Humanities"),
    BranchModel(
        branchName: "MSc in English",
        departmentName: "Department of Science and Humanities"),
    BranchModel(
        branchName: "MSc in Biology",
        departmentName: "Department of Science and Humanities"),
    BranchModel(
        branchName: "MSc in Biotechnology",
        departmentName: "Department of Science and Humanities"),
    BranchModel(
        branchName: "MSc in Environmental Science",
        departmentName: "Department of Science and Humanities"),
  ].obs;
}
