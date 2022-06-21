import 'package:fe_tennisbooking/pages/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageProvider = StateProvider<Widget>((_) => const Welcomescreen(
      key: Key('welcome'),
    ));
