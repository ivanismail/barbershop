import '../export.dart';

Widget displayNone() => SizedBox.shrink();

EdgeInsets pageWrapper() => EdgeInsets.symmetric(horizontal: PAGE_WRAPPER);
double pageWrapperInt() => 12;
EdgeInsets paddingAll() => EdgeInsets.symmetric(horizontal: 16, vertical: 8);

class Spacing extends StatelessWidget {
  const Spacing({
    Key? key,
    this.width = 0,
    this.height,
  }) : super(key: key);
  final double? height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height ?? 12,
      width: width,
    );
  }
}

void unfocus(BuildContext context) => FocusScope.of(context).unfocus();

/// Convert value to "Rp XX.XXX.XXX" as [String]
String rupiah(value, {String separator = '.', String trailing = ''}) {
  return "Rp " +
      value.toString().replaceAllMapped(
          new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}$separator') +
      trailing;
}

/// Convert value to "XX.XXX.XXX" as [String]
String ribuan(value, {String separator = '.', String trailing = ''}) {
  return value.toString().replaceAllMapped(
          new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}$separator') +
      trailing;
}

// bool checkToken() =>
//     GetStorage().read(XStorage.TOKEN) != '' &&
//     GetStorage().read(XStorage.TOKEN) != null;

// bool hasPin() => GetStorage().read(XStorage.PASSCODE)?.isNotEmpty ?? false;

// bool idValidation(String data) => data.length < 10;

// Future launchToApps(url) async {
//   final Uri _url = Uri.parse(url);
//   return await launchUrl(
//     _url,
//     mode: LaunchMode.externalApplication,
//   );
// }

// Future launchApp(url) async {
//   final Uri _url = Uri.parse(url);
//   return await launchUrl(
//     _url,
//     mode: LaunchMode.inAppWebView,
//   );
// }
