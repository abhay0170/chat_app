import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // go to loginPage
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    // register with email and password
    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("Password don't match")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message_sharp,
              size: 70,
              color: Theme.of(context).colorScheme.primary,
            ),
            // welcomeBack message
            Text("Let's Create a n account for you...😊"),
            SizedBox(height: 20),
            // email
            MyTextfield(
              prefixIcon: Icons.email_outlined,

              hintText: "Email",
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

            // confirm password
            MyTextfield(
              prefixIcon: Icons.lock_open_rounded,

              hintText: "Confirm password",
              obscureText: true,
              controller: _confirmPwController,
            ),
            SizedBox(height: 20),
            // login
            MyButton(buttonName: "Register", onTap: () => register(context)),
            SizedBox(height: 20),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?  "),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
