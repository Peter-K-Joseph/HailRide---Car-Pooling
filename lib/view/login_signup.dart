import 'dart:io';

import 'package:hailride/middleware/http_requests.dart';
import 'package:hailride/model/constants.dart';
import 'package:hailride/view/alerts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:hailride/model/login_signup_model.dart';
import 'package:hailride/view/dashboard.dart';
import 'package:hailride/view_model/bindings.dart';
import 'package:hailride/view_model/login_signup_controller.dart';

class TOSWidget extends StatelessWidget {
  const TOSWidget({super.key});

  Widget textSpanWidget({required String text, bool bold = false}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Text(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
            "By logging in, you agree to our",
          ),
          InkWell(
            child: const Text(
              'Terms of Service and Privacy Policy',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 74, 134),
                fontSize: 12,
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (builder) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 200,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      children: [
                        const Text(
                          "End User License Agreement",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height -
                              MediaQuery.of(context).viewInsets.bottom -
                              290,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'End-User License Agreement ("Agreement")',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'Company grants you a non-exclusive, non-transferable, revocable license to use the Software for your personal or business use, subject to the terms and conditions of this Agreement.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Restrictions:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text: 'You may not:',
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      '(a) Modify, adapt, translate, or create derivative works based on the Software.',
                                ),
                                textSpanWidget(
                                  text:
                                      '(b) Reverse engineer, decompile, disassemble, or attempt to derive the source code of the Software.',
                                ),
                                textSpanWidget(
                                  text:
                                      '(c) Remove any proprietary notices or labels from the Software.',
                                ),
                                textSpanWidget(
                                  text:
                                      '(d) Transfer, sublicense, lend, lease, or rent the Software to any third party.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Privacy Policy:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'By using the Software, you agree to the Company\'s Privacy Policy, which can be found at [Insert Link to Privacy Policy]. The Privacy Policy explains how the Company collects, uses, and protects your personal information.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Termination:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'This Agreement is effective until terminated by you or the Company. Your rights under this Agreement will terminate automatically without notice from the Company if you fail to comply with any term(s) of this Agreement.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Warranty Disclaimer:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'The Software is provided "as is" without any warranties, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Limitation of Liability:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'The Company shall not be liable for any direct, indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, arising from your use of the Software.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Governing Law:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'This Agreement shall be governed by and construed in accordance with the laws of [Insert Jurisdiction]. Any legal action or proceeding arising under this Agreement shall be brought exclusively in the federal or state courts located in [Insert Jurisdiction].',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Entire Agreement:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'This Agreement constitutes the entire agreement between you and the Company concerning the Software and supersedes all prior or contemporaneous agreements, representations, warranties, and understandings.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Contact Information:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'If you have any questions about this Agreement, please contact the Company at [Insert Contact Information].',
                                ),
                                const SizedBox(height: 16.0),
                                const Text(
                                  'Privacy Policy',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'This Privacy Policy ("Policy") outlines how Nuvie Software and DataLabs LLC. ("Company," "we," "us," or "our") collects, uses, and safeguards your personal information when you use our software ("Software"). Please read this Policy carefully to understand our practices regarding your personal information.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Information We Collect:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'We may collect the following types of information:',
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      '(a) Personal Information: We may collect personal information, such as your name, email address, and contact information, when you voluntarily provide it to us.',
                                ),
                                textSpanWidget(
                                  text:
                                      '(b) Usage Information: We may collect information about how you use the Software, including log files, device information, and usage patterns.',
                                ),
                                textSpanWidget(
                                  text:
                                      '(c) Cookies and Tracking Technologies: We may use cookies and similar tracking technologies to collect information about your interactions with the Software.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Use of Information:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'We may use your personal information for the following purposes:',
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      '(a) To provide and maintain the Software.',
                                ),
                                textSpanWidget(
                                  text:
                                      '(b) To respond to your inquiries and provide customer support.',
                                ),
                                textSpanWidget(
                                  text:
                                      '(c) To send you updates, newsletters, and promotional materials.',
                                ),
                                textSpanWidget(
                                  text:
                                      '(d) To improve our Software and develop new features.',
                                ),
                                textSpanWidget(
                                  text:
                                      '(e) To enforce our End-User License Agreement (EULA).',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Data Sharing:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'We do not sell, rent, or trade your personal information with third parties. We may share your information with trusted service providers who assist us in operating our Software or conducting our business.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Data Security:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no data transmission over the internet or storage system can be guaranteed to be 100% secure.',
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Your Choices:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'You may have certain rights regarding your personal information, including the right to access, correct, or delete your data. You can exercise these rights by contacting us at the contact information below.',
                                ),
                                InkWell(
                                  child: const Text(
                                    "dataprotect.ncix@nuvie.in",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onTap: () async {
                                    final Uri emailLaunchUri = Uri(
                                      scheme: 'mailto',
                                      path: 'dataprotect.ncix@nuvie.in',
                                      queryParameters: {
                                        'subject':
                                            'Request for Removal of personal information from nuvie servers', // Replace with your subject
                                        'body':
                                            'Dear Aurora,\n\tThis is a legal request to delete all personal information mentioned below from nuvie servers.\n\nPersonal informations to be deleted\n1) User Infomation\n2)Unique Indentifiers\n\tContacts and Groups (includes messages)\n\tCalendar Events\n\tPersonal Welbeing\n\tComplete data removal\n\n\n_____DO NOT MODIFY THIS HEADER____\nAppID: nuvie_hailride\nRequestType: Data Protection ICRP\nHandler: NCIX DataProtect and Data Integrity Handler', // Replace with your message body
                                      },
                                    );
                                    if (await canLaunchUrl(emailLaunchUri)) {
                                      await launchUrl(emailLaunchUri);
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text(
                                                'Could not launch the email app.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                                textSpanWidget(
                                  text:
                                      'For any queries as to how we process your information and to know more about our privacy practises and services, you can contact us at the following email address:',
                                ),
                                InkWell(
                                  child: const Text(
                                    "datahandler.ncix@nuvie.in",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onTap: () async {
                                    final Uri emailLaunchUri = Uri(
                                      scheme: 'mailto',
                                      path: 'datahandler.ncix@nuvie.in',
                                      queryParameters: {
                                        'subject':
                                            'Request for information on personal data handling processes', // Replace with your subject
                                        'body':
                                            'Dear Aurora,\n\t\n\n_____DO NOT MODIFY THIS HEADER____\nAppID: nuvie_hailride\nRequestType: Data Process ICRP\nHandler: NCIX DataProtect and Data Integrity Handler', // Replace with your message body
                                      },
                                    );
                                    if (await canLaunchUrl(emailLaunchUri)) {
                                      await launchUrl(emailLaunchUri);
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text(
                                                'Could not launch the email app.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                textSpanWidget(
                                  text: 'Changes to this Policy:',
                                  bold: true,
                                ),
                                const SizedBox(height: 8.0),
                                textSpanWidget(
                                  text:
                                      'We may update this Policy from time to time. Any changes will be posted on our website, and the date of the latest revision will be indicated at the top of the page',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login to\nHailRide",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      autofillHints: const [AutofillHints.email],
                      decoration: InputDecoration(
                        hintText: "hello@uni.edu",
                        labelText: "Email ID",
                        floatingLabelStyle:
                            TextStyle(color: Colors.grey.shade800),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade500,
                            width: 1.5,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.lock_outline),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      controller: _controller.emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          TextFormField(
                            autofillHints: const [
                              AutofillHints.password,
                            ],
                            obscureText:
                                _controller.getPasswordVisibilityStatus(),
                            decoration: InputDecoration(
                              labelText: "Password",
                              floatingLabelStyle: TextStyle(
                                color: _controller.getPasswordVisibilityStatus()
                                    ? Colors.grey.shade800
                                    : const Color(0XFF265be9),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color:
                                      _controller.getPasswordVisibilityStatus()
                                          ? Colors.grey.shade500
                                          : const Color(0XFF265be9),
                                  width: 1.5,
                                ),
                              ),
                              prefixIcon: const Icon(Icons.lock_outline),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color:
                                      _controller.getPasswordVisibilityStatus()
                                          ? Colors.grey.shade300
                                          : const Color(0XFF265be9),
                                ),
                              ),
                              hintText: "**********",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _controller.togglePasswordVisibility();
                                },
                                icon: Icon(
                                  _controller.getPasswordVisibilityStatus()
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            controller: _controller.passwordController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          // use the  firebase auth to login
                          var response = await AuthService()
                              .signInUsingEmailAndPasswordFirebase(
                            _controller.emailController.text,
                            _controller.passwordController.text,
                          );
                          print("Got response $response");
                          // response if the response from firebase auth in string
                          if (response == "USER_NOT_FOUND") {
                            AlertingServices().alertingMesseger(
                              "User not found",
                              "The user with the email ${_controller.emailController.text} was not found. Please check the email and try again.",
                              "error",
                              Icons.error,
                            );
                          } else if (response == "INVALID_LOGIN_CREDENTIALS") {
                            AlertingServices().alertingMesseger(
                              "error",
                              "Wrong password",
                              "The password you entered is incorrect. Please check the password and try again.",
                              Icons.error,
                            );
                          } else if (response == "success") {
                            Get.offAll(
                              () => Dashboard(),
                              binding: InitBindings(),
                              transition: Transition.downToUp,
                            );
                          } else {
                            print("Found response $response");
                            AlertingServices().alertingMesseger(
                              "error",
                              "Something went wrong",
                              "Something went wrong while logging in. Please try again.",
                              Icons.error,
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0XFF265be9),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 74, 134),
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      Get.offAll(
                        () => SignupPage(),
                        binding: SignUpBindings(),
                        transition: Transition.downToUp,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  InputBorderDefinition inputBorderDefinition = InputBorderDefinition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign Up for\nHailRide",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Mohith",
                          labelText: "Name",
                          floatingLabelStyle:
                              TextStyle(color: Colors.grey.shade800),
                          focusedBorder: inputBorderDefinition.focusedBorder,
                          errorBorder: inputBorderDefinition.errorBorder,
                          prefixIcon: const Icon(Icons.person),
                          enabledBorder: inputBorderDefinition.enabledBorder,
                          focusedErrorBorder: inputBorderDefinition.errorBorder,
                        ),
                        controller: Get.find<SignUpController>().nameController,
                        keyboardType: TextInputType.url,
                        autocorrect: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autofillHints: const [AutofillHints.email],
                        decoration: InputDecoration(
                          hintText: "hello@hailride.in",
                          labelText: "Email ID",
                          floatingLabelStyle:
                              TextStyle(color: Colors.grey.shade800),
                          focusedBorder: inputBorderDefinition.focusedBorder,
                          prefixIcon: const Icon(Icons.email_outlined),
                          errorBorder: inputBorderDefinition.errorBorder,
                          enabledBorder: inputBorderDefinition.enabledBorder,
                          focusedErrorBorder: inputBorderDefinition.errorBorder,
                        ),
                        controller:
                            Get.find<SignUpController>().emailController,
                        keyboardType: TextInputType.name,
                        autocorrect: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          }
                          if ((!value.contains("@") && !value.contains(".")) ||
                              value.contains(" ") ||
                              value.split(".").last.length > 5) {
                            return "$value is an invalid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "supersecret123",
                          labelText: "Password",
                          floatingLabelStyle:
                              TextStyle(color: Colors.grey.shade800),
                          focusedBorder: inputBorderDefinition.focusedBorder,
                          prefixIcon: const Icon(Icons.perm_identity_outlined),
                          enabledBorder: inputBorderDefinition.enabledBorder,
                          errorBorder: inputBorderDefinition.errorBorder,
                          focusedErrorBorder: inputBorderDefinition.errorBorder,
                        ),
                        controller:
                            Get.find<SignUpController>().passwordController,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (value.length < 8) {
                            return "Password is less than 8 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "9876543210",
                          labelText: "Phone Number",
                          floatingLabelStyle:
                              TextStyle(color: Colors.grey.shade800),
                          focusedBorder: inputBorderDefinition.focusedBorder,
                          prefixIcon: const Icon(Icons.numbers),
                          enabledBorder: inputBorderDefinition.enabledBorder,
                          errorBorder: inputBorderDefinition.errorBorder,
                          focusedErrorBorder: inputBorderDefinition.errorBorder,
                        ),
                        controller:
                            Get.find<SignUpController>().phoneController,
                        keyboardType: TextInputType.phone,
                        autocorrect: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone cannot be empty";
                          }
                          if (value.length != 10) {
                            return "Phone number is not 10 digits";
                          }
                          if (value.contains(" ")) {
                            return "Phone number cannot contain spaces";
                          }
                          if (int.tryParse(value) == null) {
                            return "Phone number is not a number";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await AuthService()
                                  .signUpWithEmailAndPasswordFirebase(
                                Get.find<SignUpController>()
                                    .emailController
                                    .text,
                                Get.find<SignUpController>()
                                    .passwordController
                                    .text,
                                Get.find<SignUpController>()
                                    .phoneController
                                    .text,
                                Get.find<SignUpController>()
                                    .nameController
                                    .text,
                              );
                              Get.to(
                                AccountVerified(
                                  requestModel: OTPRequestModel(
                                      email: Get.find<SignUpController>()
                                          .emailController
                                          .text,
                                      phone: Get.find<SignUpController>()
                                          .phoneController
                                          .text,
                                      name: Get.find<SignUpController>()
                                          .nameController
                                          .text,
                                      password: Get.find<SignUpController>()
                                          .passwordController
                                          .text),
                                ),
                                transition: Transition.cupertino,
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0XFF265be9),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            ),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 74, 134),
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        Get.offAll(
                          () => LoginPage(),
                          transition: Transition.downToUp,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const TOSWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AccountVerified extends StatelessWidget {
  final OTPRequestModel requestModel;
  const AccountVerified({Key? key, required this.requestModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/success.json",
                animate: true,
                repeat: false,
              ),
              const Text(
                "Account Verified",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Your account has been verified successfully! Please proceed to enter the details to setup your account up.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.offAll(
                    () => Dashboard(),
                    binding: InitBindings(),
                    transition: Transition.cupertino,
                  );
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF265be9),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SetupScreen extends StatelessWidget {
  final SetupScreenModel screenModel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SetupScreen({Key? key, required this.screenModel}) : super(key: key);
  InputBorderDefinition inputBorderDefinition = InputBorderDefinition();

  @override
  Widget build(BuildContext context) {
    screenModel.domain = "Christ (Deemed to be University)";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Onboarding")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/mesh-757.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "👋",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Hey, ${screenModel.admissionNo}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Let's get you on board for the to the world of next generation campus experience.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        autofillHints: const [
                          AutofillHints.name,
                        ],
                        controller:
                            Get.find<SetupScreenController>().nameController,
                        decoration: InputDecoration(
                          hintText: "John Doe",
                          labelText: "Name",
                          floatingLabelStyle:
                              TextStyle(color: Colors.grey.shade800),
                          focusedBorder: inputBorderDefinition.focusedBorder,
                          prefixIcon: const Icon(Icons.perm_identity_rounded),
                          enabledBorder: inputBorderDefinition.enabledBorder,
                          errorBorder: inputBorderDefinition.errorBorder,
                          focusedErrorBorder: inputBorderDefinition.errorBorder,
                        ),
                        keyboardType: TextInputType.name,
                        autocorrect: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name cannot be empty";
                          }
                          if (value.length < 3) {
                            return "Name is less than 3 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Course"),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.all(5),
                        child: const InkWell(
                          child: Text(
                            "Not listed? Click to add",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 38, 143),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autofillHints: const [
                          AutofillHints.birthdayYear,
                        ],
                        controller:
                            Get.find<SetupScreenController>().yearOfGraduation,
                        decoration: InputDecoration(
                          hintText: DateTime.timestamp().year.toString(),
                          labelText: "Year of Graduation",
                          floatingLabelStyle:
                              TextStyle(color: Colors.grey.shade800),
                          focusedBorder: inputBorderDefinition.focusedBorder,
                          focusedErrorBorder: inputBorderDefinition.errorBorder,
                          errorBorder: inputBorderDefinition.errorBorder,
                          prefixIcon: const Icon(Icons.numbers_outlined),
                          enabledBorder: inputBorderDefinition.enabledBorder,
                        ),
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Year of Graduation cannot be empty";
                          }
                          if (value.length != 4) {
                            return "Year of Graduation is not valid";
                          }
                          if (int.tryParse(value) == null) {
                            return "Year of Graduation is not valid";
                          }
                          if (int.parse(value) > DateTime.now().year + 8) {
                            return "Year of Graduation should be less than ${DateTime.now().year + 8}";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0XFF265be9),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            ),
                          ),
                          child: const Text(
                            "Send OTP",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
