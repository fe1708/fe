import 'package:fe_tennisbooking/general/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'components/app_bar.dart';

class MainBackground extends ConsumerWidget {
  const MainBackground();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final child = ref.watch(pageProvider);
    return Scaffold(
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
            FooterView(
              footer: Footer(
                padding: const EdgeInsets.all(0),
                child: Container(
                  color: Colors.green.shade500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("FPT Ho Chi Minh campus"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.sports_tennis_outlined,
                              size: 30,
                            ),
                          ),
                          Text("Contact us: 0123456789"),
                        ],
                      ),
                      const Text("Team 1-SWD391-2022   All rights reserved"),
                    ],
                  ),
                ),
              ),
              flex: 1,
              children: const [],
            ),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: child,
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
              ),
            ),
          ],
        ),
      ),
      appBar: const AppBarComponent(),
    );
  }
}
