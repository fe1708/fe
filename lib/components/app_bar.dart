import 'package:fe_tennisbooking/general/general_provider.dart';
import 'package:fe_tennisbooking/pages/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/home.dart';
import '../pages/signup.dart';

class AppBarComponent extends ConsumerWidget with PreferredSizeWidget {
  const AppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 81, 145, 83),
      title: GestureDetector(
        onTap: () {
          ref.read(pageProvider.notifier).state = const Welcomescreen(
            key: Key('welcome'),
          );
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
            ref.read(pageProvider.notifier).state = const HomeScreen(
              key: Key('home'),
            );
          },
          child: const Text("Sign in"),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(pageProvider.notifier).state = const SignupScreen(
              key: Key('signup'),
            );
          },
          child: const Text("Sign up"),
        ),
        SizedBox(
          width: size.width * 0.65,
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
