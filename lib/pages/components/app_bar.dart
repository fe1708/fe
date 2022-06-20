import 'package:fe_tennisbooking/pages/welcomescreen.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import '../signup.dart';

class AppBarComponent extends StatelessWidget with PreferredSizeWidget {
  const AppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 81, 145, 83),
      title: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Welcomescreen(),
              ));
        },
        child: const Text(
          "Tenisu",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 02.14),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
          },
          child: const Text("Sign in"),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupScreen(),
                ));
          },
          child: const Text("Sign up"),
        ),
        const SizedBox(
          width: 800,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Find court",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Manage",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "About",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const Icon(
          Icons.notifications,
          size: 50,
        ),
        const Icon(
          Icons.person,
          size: 50,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
