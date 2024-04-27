import '../export.dart';
import '../utils/utils.dart';

class XDivider extends StatelessWidget {
  final double? height;
  const XDivider({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacing(),
        Divider(thickness: this.height ?? 8),
        Spacing(),
      ],
    );
  }
}
