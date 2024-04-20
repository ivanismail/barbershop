import '../export.dart';

class XLoading extends StatelessWidget {
  final double size;
  const XLoading({
    Key? key,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation(XColor.primary()),
        strokeWidth: 3,
      ),
    );
  }
}

class XLoadingPage extends StatelessWidget {
  const XLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
          child: CircularProgressIndicator(
        color: XColor.primary(),
      )),
    );
  }
}
