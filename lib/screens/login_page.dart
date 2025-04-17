import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // go to registerPage
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    // auth services
    final authService = AuthService();

    // try to log in
    try {
      await authService.signInWithEmailAndPassword(
        _emailController.text,
        _pwController.text,
      );

      // catch if there is any error
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              // logo
              SizedBox(
                height: 80,
                child: Image(image: AssetImage("assets/logo/logo.png")),
              ),
              SizedBox(height: 10),
              Text(
                "We're excited to have you here. 😊",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // email
              MyTextfield(
                hintText: "Email",
                prefixIcon: Icons.email_outlined,
                obscureText: false,
                controller: _emailController,
              ),
              SizedBox(height: 20),
              // password
              MyTextfield(
                prefixIcon: Icons.lock_open_rounded,
                hintText: "Password",
                obscureText: true,
                controller: _pwController,
              ),
              SizedBox(height: 20),
              // login
              MyButton(buttonName: "Login", onTap: () => login(context)),
              SizedBox(height: 20),
              // register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Note a member ?  "),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image(image: AssetImage("assets/logo/google.png")),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image(image: AssetImage("assets/logo/facebook.png")),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image(image: AssetImage("assets/logo/apple.png")),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image(
                      image: AssetImage("assets/logo/instagram.png"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
