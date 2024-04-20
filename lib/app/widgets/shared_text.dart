import 'package:barbershop/app/widgets/ripple.dart';

import '../export.dart';
import '../utils/utils.dart';

class RowText extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Function()? onTap;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? textStyle;

  const RowText({
    Key? key,
    this.title,
    this.subTitle,
    this.onTap,
    this.mainAxisAlignment,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: this.mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        this.title != null
            ? Text(this.title.toString(), style: this.textStyle ?? h4n)
            : displayNone(),
        Spacing(width: 5),
        this.subTitle != null
            ? XRipple(
                onTap: this.onTap ?? () {},
                child: Text(
                  this.subTitle.toString(),
                  style: TextStyle(
                    fontSize: h4,
                    color: XColor.primary(),
                  ),
                ),
              )
            : displayNone(),
      ],
    );
  }
}

class ColumnText extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextStyle? titleStyle;
  final TextStyle? subStyle;
  final Widget? spacing;
  const ColumnText({
    Key? key,
    this.title,
    this.subTitle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.titleStyle,
    this.spacing,
    this.subStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: this.mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: this.crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        this.title != null
            ? Text(
                this.title.toString(),
                style: this.titleStyle ??
                    TextStyle(
                      fontSize: h5,
                      color: XColor.netral8(),
                      fontWeight: FontWeight.w600,
                    ),
              )
            : displayNone(),
        this.spacing ?? Spacing(),
        this.subTitle != null
            ? Text(
                this.subTitle.toString(),
                style: this.subStyle ??
                    TextStyle(
                      fontSize: h4,
                      color: XColor.netral8(),
                    ),
              )
            : displayNone(),
      ],
    );
  }
}

class RowTextHome extends StatelessWidget {
  final Function()? onTap;
  final String? title, subTitle;
  const RowTextHome({
    Key? key,
    this.onTap,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: pageWrapper(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.title.toString(),
                style: TextStyle(
                  fontSize: h3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              XRipple(
                onTap: this.onTap ?? () {},
                child: Text(
                  this.subTitle ?? 'Lihat Semua',
                  style: TextStyle(
                    color: XColor.primary(),
                    fontSize: h3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacing(height: h3),
      ],
    );
  }
}

class ColumnTextProfile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextStyle? titleStyle;
  const ColumnTextProfile({
    Key? key,
    this.title,
    this.subTitle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: this.mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: this.crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        this.title != null
            ? Text(
                this.title.toString(),
                style: this.titleStyle ??
                    TextStyle(
                      fontSize: h3,
                      color: XColor.netral5(),
                      fontWeight: FontWeight.w400,
                    ),
              )
            : displayNone(),
        this.subTitle != null
            ? Text(
                this.subTitle.toString(),
                style: TextStyle(
                  fontSize: h3,
                  color: XColor.netral8(),
                ),
              )
            : displayNone(),
      ],
    );
  }
}

class SharedText {
  static Widget label(
    String title, {
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? h2,
              color: color ?? XColor.netral7(),
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
          ),
          Spacing(),
        ],
      );

  static Widget normal(
    String title, {
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? h3,
              color: color ?? XColor.netral7(),
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
          ),
        ],
      );
}

class RowTextDetail extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Function()? onTap;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? textStyle;
  final bool? icon;

  const RowTextDetail({
    Key? key,
    this.title,
    this.subTitle,
    this.onTap,
    this.mainAxisAlignment,
    this.textStyle,
    this.icon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          this.mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: [
        this.title != null
            ? Text(this.title.toString(), style: h3l)
            : displayNone(),
        Spacing(width: 5),
        this.subTitle != null
            ? XRipple(
                onTap: this.onTap ?? () {},
                child: Row(
                  children: [
                    Text(
                      this.subTitle.toString(),
                      style: this.textStyle ?? h3n,
                    ),
                    this.icon == false
                        ? displayNone()
                        : SvgPicture.asset(
                            'assets/arrow-right.svg',
                            color: XColor.netral8(),
                          )
                  ],
                ),
              )
            : displayNone(),
      ],
    );
  }
}
