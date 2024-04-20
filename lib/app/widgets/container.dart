import '../export.dart';
import '../utils/utils.dart';

class SharedCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final double? width;
  final double? spacing;
  const SharedCard({
    Key? key,
    this.child,
    this.padding,
    this.borderRadius,
    this.color,
    this.width,
    this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width ?? Get.width,
      padding: this.padding ?? EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: this.borderRadius ?? XTheme.borderRadius(),
        border: Border.all(
          color: XColor.netral2(),
        ),
        color: this.color ?? XColor.netral1(),
        boxShadow: XTheme.botShadow(),
      ),
      child: this.child,
    );
  }
}

class XCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final double? spacing;
  const XCard({
    Key? key,
    this.child,
    this.padding,
    this.borderRadius,
    this.color,
    this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: this.padding ?? EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: this.borderRadius ?? XTheme.borderRadius(),
            border: Border.all(
              color: XColor.netral2(),
            ),
            color: this.color ?? XColor.netral1(),
            boxShadow: XTheme.botShadow(),
          ),
          child: this.child,
        ),
        Spacing(
          height: this.spacing ?? 12,
        )
      ],
    );
  }
}

class XHistoryCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final double? spacing;
  const XHistoryCard({
    Key? key,
    this.child,
    this.padding,
    this.borderRadius,
    this.color,
    this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.padding ?? EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: this.borderRadius ?? XTheme.borderRadius(),
        border: Border.all(
          color: XColor.netral2(),
        ),
        color: this.color ?? XColor.netral1(),
        boxShadow: XTheme.botShadow(),
      ),
      child: this.child,
    );
  }
}
