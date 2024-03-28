import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bottom_navbar.dart';
import '../controllers/wrapper_controller.dart';

class WrapperView extends StatefulWidget {
  WrapperView({Key? key}) : super(key: key);

  @override
  State<WrapperView> createState() => _WrapperViewState();
}

class _WrapperViewState extends State<WrapperView> {
  final WrapperController controller = Get.find<WrapperController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<WrapperController>(
        init: WrapperController(),
        initState: (_) {},
        builder: (_) {
          return BuildBottomNavBar(
            controller: controller,
          );
        },
      ),
      body: DoubleBackToCloseApp(
        child: Obx(() => controller.currentPage[controller.pageIndex.value]),
        snackBar: SnackBar(
          content: Text('Ketuk sekali lagi untuk keluar.'),
        ),
      ),
    );
  }
}
