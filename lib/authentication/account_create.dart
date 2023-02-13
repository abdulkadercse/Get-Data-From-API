import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:universe_soft_care/authentication/sign_in.dart';
import 'package:universe_soft_care/repository/auth_repo.dart';

class AccountCreate extends StatefulWidget {
  const AccountCreate({Key? key}) : super(key: key);

  @override
  State<AccountCreate> createState() => _AccountCreateState();
}

class _AccountCreateState extends State<AccountCreate> {
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController emailNameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("New Account Create"),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "First Name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextField(
                controller: firstNameEditingController,
                textFieldType: TextFieldType.NAME,
                decoration: const InputDecoration(
                    hintText: "Enter your First Name",
                    border: OutlineInputBorder()),
              ),
              const Text(
                "Last Name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextField(
                controller: lastNameEditingController,
                textFieldType: TextFieldType.NAME,
                decoration: const InputDecoration(
                    hintText: "Enter your Last Name",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextField(
                controller: emailNameEditingController,
                textFieldType: TextFieldType.EMAIL,
                decoration: const InputDecoration(
                    hintText: "Enter your email address",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "password",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextField(
                controller: passwordEditingController,
                textFieldType: TextFieldType.PASSWORD,
                decoration: const InputDecoration(
                    hintText: "Enter your password",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Confirm Password",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextField(
                controller: confirmPasswordEditingController,
                textFieldType: TextFieldType.PASSWORD,
                decoration: const InputDecoration(
                    hintText: "Enter your confirm password",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                    child: Text(
                  "Account Create",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
              ).onTap(() async {
                if (firstNameEditingController.text.isEmpty) {
                  toast("Please Enter your first name");
                } else if (lastNameEditingController.text.isEmpty) {
                  toast("Please Enter your last name");
                } else if (emailNameEditingController.text.isEmpty) {
                  toast("Please Enter your email address");
                } else if (passwordEditingController.text.length < 6) {
                  toast("Password should be at least 6 digit");
                } else if (confirmPasswordEditingController.text.length < 6) {
                  toast("Password should be at least 6 digit");
                } else if (passwordEditingController.text !=
                    confirmPasswordEditingController.text) {
                  toast("Don't match the password");
                } else {
                  try {
                    EasyLoading.show(status: "Signing up");
                    bool status = await AuthRepo().signUpWithEmail(
                        firstNameEditingController.text,
                        lastNameEditingController.text,
                        emailNameEditingController.text,
                        passwordEditingController.text,
                        confirmPasswordEditingController.text);
                    if (status) {
                      EasyLoading.showSuccess("Sign Up Successful");
                    } else {
                      EasyLoading.showError(
                          "something went wrong  please try again");
                    }
                  } catch (e) {
                    EasyLoading.showError(e.toString());
                  }
                }
              }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "already have an account?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Sign in",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ).onTap(() => const SignIn().launch(context))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
