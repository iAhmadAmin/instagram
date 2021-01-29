import 'package:flutter/material.dart';
import 'package:instagram/core/controllers/main_controller.dart';
import 'package:instagram/core/models/user_model.dart';
import 'package:instagram/core/services/auth_service.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Auth/login_page.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:instagram/ui/widgets/auth_button.dart';
import 'package:instagram/ui/widgets/input_field.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    "assets/images/insta_logo.png",
                    height: getProportionateScreenWidth(60),
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InputField(
                    controller: _emailController,
                    hint: "Email",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputField(
                    controller: _nameController,
                    hint: "Full Name",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputField(
                    controller: _usernameController,
                    hint: "Username",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputField(
                    isPassField: true,
                    controller: _passwordController,
                    hint: "Password",
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  GetBuilder<MainController>(builder: (value) {
                    return AuthButton(
                      btnClr: primaryColor,
                      label: "Sign up",
                      isLoading: value.isLoading,
                      onTap: () {
                        _validate();
                      },
                    );
                  }),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: const Text(
                      "By signing up, you agree to our Terms , Data Policy and Cookies Policy .",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have an account? "),
                GestureDetector(
                  onTap: () {
                    Get.off(LoginPage());
                  },
                  child: Text(
                    "Login",
                    style: impBodyTextStyle.copyWith(color: primaryColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _validate() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      AuthService().signup(
          userModel: UserModel(
              username: _usernameController.text,
              name: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text));
    } else {
      Get.snackbar("Required*", "All fields are required.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
