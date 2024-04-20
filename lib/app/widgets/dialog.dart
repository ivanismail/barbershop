import 'package:barbershop/app/widgets/buttons.dart';
import 'package:barbershop/app/widgets/loading.dart';
import 'package:flutter/foundation.dart';

import '../export.dart';
import '../utils/utils.dart';

class XDialog {
  static Future show({
    required Widget title,
    Widget? content,
    Widget? icon,
    List<Widget>? actions,
    bool allowPop = false,
  }) async {
    return await Get.dialog(
      WillPopScope(
        onWillPop: () async {
          if (kDebugMode) return true;

          return allowPop;
        },
        child: AlertDialog(
          titlePadding: pageWrapper().copyWith(
            top: 18,
            bottom: 18,
          ),
          contentPadding: pageWrapper().copyWith(
            // right: 22,
            // left: 22,
            bottom: 12,
          ),
          actionsPadding: pageWrapper(),
          title: Column(
            children: [
              icon != null
                  ? Column(
                      children: [
                        icon,
                        Spacing(height: 12),
                      ],
                    )
                  : displayNone(),
              title,
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: XTheme.borderRadius(),
          ),
          content: content,
          actions: actions,
        ),
      ),
      barrierDismissible: false,
    );
  }

  static Future confirmDefault({
    required Widget title,
    Widget? content,
    Widget? icon,
    List<Widget>? actions,
  }) async {
    return await Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: XTheme.borderRadius(),
          ),
          title: title,
          content: content,
          actions: actions,
        ),
      ),
      barrierDismissible: false,
    );
  }

  static Future loading() async {
    return await Get.dialog(
      WillPopScope(
        onWillPop: () async => kDebugMode,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: XTheme.borderRadius(),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              XLoading(size: 24),
              Spacing(height: 18),
              Text('Memuat ...'),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static Future errorConnection({
    required String message,
    String actionText = 'Keluar',
    Widget? icon,
    VoidCallback? onTap,
  }) async {
    return await Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          actionsPadding: EdgeInsets.all(12),
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.all(12),
          titlePadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: XTheme.borderRadius(),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: XColor.netral1(),
                  boxShadow: XTheme.botShadow(),
                ),
                padding: EdgeInsets.all(2),
                child: SvgPicture.asset(
                  'assets/gps.svg',
                  width: 80,
                  height: 80,
                ),
              ),
              Spacing(height: 16),
              Text(
                'Anda Sedang Offline.',
                style: TextStyle(
                  color: XColor.netral8(),
                  fontWeight: FontWeight.w600,
                  fontSize: h5,
                ),
                textAlign: TextAlign.center,
              ),
              Spacing(height: 14),
              Text(
                message.tr,
                style: TextStyle(
                  color: XColor.netral8(),
                  fontSize: h4,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: SolidButton(
                    borderSide: BorderSide(color: XColor.danger()),
                    backgroudColor: XColor.danger(),
                    text: actionText,
                    style: TextStyle(color: XColor.netral1(), fontSize: h3),
                    onTap: onTap ?? () => Get.back(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      transitionCurve: Curves.fastOutSlowIn,
      barrierDismissible: false,
    );
  }
}
