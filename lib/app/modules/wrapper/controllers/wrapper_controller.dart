import 'package:barbershop/app/modules/profile/views/profile_view.dart';

import '../../../export.dart';
import '../../../widgets/bottom_navbar.dart';
import '../../home/views/home_view.dart';

class WrapperController extends GetxController {
  final pageIndex = 0.obs;
  String connectionStatus = 'Unknown';
  // final Connectivity connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> connectivitySubscription;

  List<Widget> get currentPage {
    return [
      HomeView(),
      HomeView(),
      ProfileView(),
    ];
  }

  List<BottomNavigationBarItem> get bottomMenuItem {
    return [
      BottomNavigationBarItem(
        label: 'Home',
        icon: BuildIconNavBar(
          currentTab: this.pageIndex.value,
          index: 0,
          svg: 'home',
          svgActive: 'home-fill',
        ),
      ),
      BottomNavigationBarItem(
        label: 'Tranaction',
        icon: BuildIconNavBar(
          currentTab: this.pageIndex.value,
          index: 1,
          svg: 'receipt',
          svgActive: 'receipt-fill',
        ),
      ),
      BottomNavigationBarItem(
        label: 'Profile',
        icon: BuildIconNavBar(
          currentTab: this.pageIndex.value,
          index: 2,
          svg: 'user',
          svgActive: 'user-fill',
        ),
      )
    ];
  }

  @override
  void onInit() async {
    super.onInit();

    // initConnectivity();
    // connectivitySubscription =
    //     connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  updateBottomNavbar() {
    update();
  }

  void onTapBottomNavbar(int index) async {
    // if (!checkToken()) {
    //   await Get.toNamed(Routes.AUTH);
    //   return;
    // }

    this.pageIndex.value = index;
  }

  @override
  void onReady() async {
    super.onReady();
    print('================ Ready Wrapper ================');

    // await this.doCheckAppVersion();
  }

  @override
  void onClose() {
    // connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initConnectivity() async {
  //   ConnectivityResult result = ConnectivityResult.none;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await connectivity.checkConnectivity();
  //   } on PlatformException catch (e) {
  //     print(e.toString());
  //   }

  //   return updateConnectionStatus(result);
  // }

  // Future<void> updateConnectionStatus(ConnectivityResult result) async {
  //   if (result == ConnectivityResult.none) {
  //     XDialog.errorConnection(
  //       message: 'Silahkan periksa koneksi internet anda.',
  //       actionText: 'Tutup',
  //       onTap: () => exit(1),
  //     );
  //   } else {
  //     Get.back();
  //   }

  //   print(result);
  // }
}
