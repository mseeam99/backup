import 'package:ally/components/my_button.dart';
import 'package:ally/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
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
              const Icon(
                Icons.chat_bubble,
                size: 100,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              const Text(
                "Find your ally here !",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              MyTextField(
                controller: emailController,
                hintText: 'Please enter your Email',
                obsecureText: false,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Please enter your Password',
                obsecureText: true,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              MyButton(onTap: signIn, text: "Log in ..."),
              const Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?'),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register now",
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
