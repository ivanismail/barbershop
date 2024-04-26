import '../export.dart';
import '../utils/utils.dart';

class XAppBar {
  static PreferredSizeWidget normal(
    String title, {
    bool showBackButton = true,
    Widget? leading,
    List<Widget>? actions,
    double? elevation,
    VoidCallback? backButtonTap,
  }) =>
      AppBar(
        centerTitle: true,
        titleSpacing: showBackButton ? 0 : pageWrapperInt(),
        elevation: elevation ?? 2,
        leading: showBackButton
            ? leading ??
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: XColor.netral1(),
                    size: h5,
                  ),
                  onPressed: backButtonTap ?? () => Get.back(),
                )
            : null,
        title: Text(
          title,
          style: TextStyle(
            color: XColor.netral1(),
            fontWeight: FontWeight.w400,
            fontSize: h6,
          ),
        ),
        backgroundColor: XColor.primary(),
        actions: actions,
      );

  static PreferredSizeWidget wrapper({
    String? title,
    VoidCallback? onTap,
    bool showBasket = true,
  }) =>
      AppBar(
        titleSpacing: PAGE_WRAPPER,
        elevation: 1,
        centerTitle: false,
        title: Text(
          title ?? '',
          style: TextStyle(
            color: XColor.netral7(),
            fontWeight: FontWeight.w600,
            fontSize: h4,
          ),
        ),
        backgroundColor: XColor.netral1(),
      );

  static PreferredSizeWidget normalTitle(String title, bool? centerTitle,
          {bool showBackButton = true, Widget? leading}) =>
      AppBar(
        titleSpacing: showBackButton ? 0 : pageWrapperInt(),
        elevation: 2,
        leading: showBackButton
            ? leading ??
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: XColor.netral7(),
                    size: 16,
                  ),
                  onPressed: () => Get.back(),
                )
            : null,
        title: Text(
          title,
          style: TextStyle(
            color: XColor.netral7(),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        backgroundColor: XColor.netral1(),
        centerTitle: centerTitle,
      );

  // static AppBar field({
  //   bool showBackButton = true,
  //   double? elevation = 2,
  //   PreferredSizeWidget? bottom,
  //   required VoidCallback onTapClose,
  //   required Function(String) onChange,
  //   required FocusNode focusNode,
  // }) {
  //   return AppBar(
  //     titleSpacing: showBackButton ? 0 : pageWrapperInt(),
  //     elevation: elevation,
  //     leading: showBackButton
  //         ? IconButton(
  //             icon: Icon(
  //               Icons.arrow_back_ios_new_sharp,
  //               color: XColor.netral7(),
  //               size: 16,
  //             ),
  //             onPressed: () => Get.back(),
  //           )
  //         : null,
  //     title: XTextField(
  //       hintText: 'Ketik untuk melakukan pencarian',
  //       focusNode: focusNode,
  //       onChange: onChange,
  //     ),
  //     backgroundColor: XColor.netral1(),
  //     bottom: bottom,
  //     actions: [
  //       TextButton(
  //         style: ButtonStyle(
  //           shape: MaterialStateProperty.resolveWith(
  //             (states) => RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(100),
  //             ),
  //           ),
  //           overlayColor: MaterialStateColor.resolveWith(
  //             (states) => Colors.grey.shade100,
  //           ),
  //         ),
  //         onPressed: onTapClose,
  //         child: Icon(
  //           Icons.close,
  //           color: XColor.primary(),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

class CLeadingAppbar extends StatelessWidget {
  final IconData icon;
  final String? title;
  final double size;
  const CLeadingAppbar({
    Key? key,
    this.icon = Icons.arrow_back,
    this.size = 20,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            this.icon,
            color: XColor.netral1(),
            size: this.size,
          ),
          onPressed: () => Get.back(),
        ),
        // Spacing(width: 12),
        Text(
          this.title != null ? this.title.toString() : '',
          style: TextStyle(
            fontSize: h2,
            color: XColor.netral1(),
          ),
        )
      ],
    );
  }
}
