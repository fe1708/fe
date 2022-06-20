import 'package:fe_tennisbooking/pages/components/app_bar.dart';
import 'package:fe_tennisbooking/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void login(String email, password) async {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarComponent(),
      backgroundColor: Colors.green.shade300,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
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
                        "Sign in",
                        style: TextStyle(fontSize: 40),
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          label: const Text("Username"),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green.shade400),
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
                            borderSide:
                                BorderSide(color: Colors.green.shade400),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          login(emailController.text, passController.text);
                        },
                        child: const Text("Login"),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ));
                          },
                          child: const Text("Create Account"))
                    ],
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
