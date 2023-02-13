import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:universe_soft_care/Screens/home_screen.dart';
import 'account_create.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Sign in to your account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
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
                controller: emailEditingController,
                textFieldType: TextFieldType.EMAIL,
                decoration: const InputDecoration(
                    hintText: "Enter your Email Address",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Password",
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
                    hintText: "Enter your Email Address",
                    border: OutlineInputBorder()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      activeColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                  const Text("Remember me",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
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
                  "Sign in",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
              ).onTap(() {
                const HomeScreen().launch(context);
              }),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Forget password?",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.green),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ).onTap(() => const AccountCreate().launch(context))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
