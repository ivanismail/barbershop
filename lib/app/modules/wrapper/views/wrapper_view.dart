import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wrapper_controller.dart';

class WrapperView extends GetView<WrapperController> {
  const WrapperView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WrapperView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WrapperView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
