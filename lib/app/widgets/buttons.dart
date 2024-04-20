import 'package:barbershop/app/widgets/loading.dart';
import 'package:flutter/rendering.dart';

import '../export.dart';
import '../utils/utils.dart';

class SolidButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EdgeInsets? padding;
  final Function()? onTap;
  final Color? backgroudColor;
  final bool inactive;
  final Widget? prefixIcon;
  final ChildLayoutHelper? child;
  final bool? loading;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;

  const SolidButton({
    Key? key,
    required this.text,
    this.style,
    this.padding,
    this.onTap,
    this.backgroudColor,
    this.inactive = false,
    this.prefixIcon,
    this.child,
    this.loading = false,
    this.borderRadius,
    this.borderSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: this.borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: this.borderRadius!,
                side: this.borderSide ?? BorderSide(color: XColor.primary()),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                side: this.borderSide ??
                    BorderSide(
                        color: this.inactive
                            ? XColor.netral4()
                            : XColor.primary()),
              ),
        elevation: 0,
        backgroundColor: this.inactive
            ? XColor.netral4()
            : this.backgroudColor ?? XColor.primary(),
        padding: this.padding ?? EdgeInsets.all(12),
      ),
      onPressed: this.loading! ? null : this.onTap ?? () {},
      child: this.loading!
          ? XLoading()
          : this.prefixIcon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    this.prefixIcon!,
                    Spacing(width: 8),
                    Text(
                      this.text,
                      style: this.style ??
                          TextStyle(
                            fontSize: h3,
                            color: this.inactive
                                ? XColor.netral1()
                                : XColor.netral8(),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                )
              : Text(
                  this.text,
                  style: this.style ??
                      TextStyle(
                        fontSize: h3,
                        color:
                            this.inactive ? XColor.netral1() : XColor.netral8(),
                        fontWeight: FontWeight.w600,
                      ),
                ),
    );
  }
}

class XOutlineButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EdgeInsets? padding;
  final Color? color, bacgroundColor;
  final Widget? prefixIcon;
  final Function()? onTap;
  final bool? active;
  final BorderRadius? borderRadius;

  const XOutlineButton({
    Key? key,
    required this.text,
    this.style,
    this.padding,
    this.color,
    this.prefixIcon,
    this.onTap,
    this.active,
    this.borderRadius,
    this.bacgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: this.borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: this.borderRadius!,
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
        backgroundColor: this.bacgroundColor ?? XColor.netral5(),
        elevation: 0,
        foregroundColor: color ?? XColor.primary(),
        padding: padding,
        side: BorderSide(
          color: color ?? XColor.primary(),
        ),
      ),
      onPressed: this.onTap ?? () {},
      child: prefixIcon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                this.prefixIcon!,
                Spacing(width: 8),
                Text(
                  this.text,
                  style: style,
                ),
              ],
            )
          : Text(
              this.text,
              style: style,
            ),
    );
  }
}

class XTextButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EdgeInsets? padding;
  final Function()? onTap;

  const XTextButton({
    Key? key,
    required this.text,
    this.style,
    this.padding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        elevation: 0,
        // primary: XColor.primary(),
        padding: padding,
      ),
      onPressed: this.onTap ?? () {},
      child: Text(
        this.text,
        style: style,
      ),
    );
  }
}
