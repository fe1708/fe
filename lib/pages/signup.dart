import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/app_bar.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void signup(String email, password) async {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        final user = FirebaseAuth.instance.currentUser;
        final token = await user!.getIdToken();
        print(token);
      } catch (e) {
        print(e);
      }
    }

    String email, password;
    var emailController = TextEditingController(),
        passController = TextEditingController();

    return Scaffold(
      appBar: const AppBarComponent(),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/Tennisbg.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                width: 800,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 40),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: const Text("Username"),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green.shade400),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    TextField(
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text("Password"),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green.shade400),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        signup(emailController.text, passController.text);
                      },
                      child: const Text("Register"),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Have account?"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
