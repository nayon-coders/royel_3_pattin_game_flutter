import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/frod_controller.dart';

class FrodView extends GetView<FrodController> {
  const FrodView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You cheater'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Hi, I do work for you. But you are not pay me. You are frode client. Thanks for your cheating',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
