import 'package:ally/components/my_button.dart';
import 'package:ally/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_college.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String myCollege = "Select your University";
  String myCollegeTrack = "";

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password does not match !"),
        ),
      );
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(nameController.text,
          emailController.text, passwordController.text, myCollege);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              const Text(
                "Create an account !",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              MyTextField(
                controller: nameController,
                hintText: 'Enter Name',
                obsecureText: false,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              MyTextField(
                controller: emailController,
                hintText: 'Enter Email',
                obsecureText: false,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Enter Password',
                obsecureText: true,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obsecureText: true,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                myCollege,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black38),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              CollegeDropdownButton(
                onCollegeSelected: (value) {
                  setState(() {
                    myCollege = value;
                    myCollegeTrack = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              MyButton(onTap: signUp, text: "Sign in ..."),
              const Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Login now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
