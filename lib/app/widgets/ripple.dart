import '../export.dart';

class XRipple extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  const XRipple({
    Key? key,
    required this.child,
    this.onTap,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        this.child,
        Positioned.fill(
          child: Material(
            borderRadius: borderRadius ?? XTheme.borderRadius(),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: borderRadius ?? XTheme.borderRadius(),
              onTap: this.onTap,
            ),
          ),
        ),
      ],
    );
  }
}
